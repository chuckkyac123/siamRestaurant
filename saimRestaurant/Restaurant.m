#import "Restaurant.h"

@interface Restaurant ()

@end

@implementation Restaurant
@synthesize dictForViewCon=_dictForViewCon;
- (void)viewDidLoad {
    [super viewDidLoad];
    // _dictForViewCon
    [self setNav];
    NSData *imageDa =[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://cs.siam.edu:81/%@",[_dictForViewCon objectForKey:@"restaurant_image_address"]]]];
    text02.image = [UIImage imageWithData:imageDa];
    text01.text=[_dictForViewCon objectForKey:@"restaurant_description"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setDictForViewCon:(NSDictionary *)dictForViewCon
{
    
    _dictForViewCon = dictForViewCon;
    
}
-(void)setNav{
    
    self.title = [_dictForViewCon objectForKey:@"restaurant_name"];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
