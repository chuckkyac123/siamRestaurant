
#import "ViewController.h"
#import "CustomUiTableViewCell.h"
#import "DetialViewController.h"
@interface ViewController ()
{
    NSDictionary *dict;
    NSArray *imagArray ,*nameArray , *priceArray ,*pointLink ;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNav];

    
    dataSelectMutArray =[[NSMutableArray alloc]init];
    NSString *post;
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",[postData length]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cs.siam.edu:81/select_all.php"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.0];
    [request setHTTPBody:postData];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    reData = [NSData data];
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connect) {
        NSLog(@"Connect");
        reData = [NSMutableData data];
    }else{
        NSLog(@"Error");
    }

    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [reData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [reData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Error connect database" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    dataSelectMutArray= [NSJSONSerialization JSONObjectWithData:reData options:NSJSONReadingMutableContainers error:nil];
    [myTable reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return dataSelectMutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cells = @"cellRes";
    
    CustomUiTableViewCell *cellShow = [tableView dequeueReusableCellWithIdentifier:cells];
    
    dict = [dataSelectMutArray objectAtIndex:indexPath.row];
    
    NSData *imageDa =[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://cs.siam.edu:81/%@",[dict objectForKey:@"food_image"]]]];
    cellShow.imageFood.image = [UIImage imageWithData:imageDa];
                          
    cellShow.foodName.text = [dict objectForKey:@"food_name"];
    NSString *price = [dict objectForKey:@"price"];
    NSString *price2=[NSString stringWithFormat:@"%i",[price intValue]];
    cellShow.price.text =price2;
    
    
    NSString *point =[dict objectForKey:@"food_rating"];
    
    if ([point isEqual:@"0"]) {
        
        cellShow.likePoint.image = [UIImage imageNamed:@"s0.png"];
        
    }else if ([point isEqual:@"1"]) {
        
        cellShow.likePoint.image = [UIImage imageNamed:@"s1.png"];
        
    }else if ([point isEqual:@"2"]) {
        
        cellShow.likePoint.image = [UIImage imageNamed:@"s2.png"];
        
    }else if ([point isEqual:@"3"]) {
        
        cellShow.likePoint.image = [UIImage imageNamed:@"s3.png"];
        
    }else if ([point isEqual:@"4"]) {
        
        cellShow.likePoint.image = [UIImage imageNamed:@"s4.png"];
        
    }else if ([point isEqual:@"5"]) {
        
        cellShow.likePoint.image = [UIImage imageNamed:@"s5.png"];
        
    }
    
    cellShow.imageFood.layer.shadowColor=[[UIColor blackColor]CGColor];
    cellShow.imageFood.layer.shadowOffset=CGSizeMake(0.0f, 5.0f);
    cellShow.imageFood.layer.shadowOpacity=1.0f;
    cellShow.imageFood.layer.shadowRadius=2.0f;
 
    
    return cellShow;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"FoodDetial" sender:self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //[dict objectForKey:@"food_image"]
    
    if([[segue identifier]isEqualToString:@"FoodDetial"]){
        NSIndexPath *indexPath = [myTable indexPathForSelectedRow];
        dict = [dataSelectMutArray objectAtIndex:indexPath.row];

        [[segue destinationViewController]setDictForViewCon:dict];
    }
    
}

-(void)setNav{
    
    self.title = @"SiamRestaurant";
 
}

- (IBAction)btnSearch:(id)sender {

    [self performSegueWithIdentifier:@"Map" sender:self];
    
}


@end
