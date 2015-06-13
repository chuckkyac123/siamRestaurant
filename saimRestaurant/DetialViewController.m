#import "DetialViewController.h"

@interface DetialViewController ()

@end

@implementation DetialViewController
@synthesize dictForViewCon=_dictForViewCon;
- (void)viewDidLoad {
    [super viewDidLoad];
    // _dictForViewCon
    [self setNav];
    NSData *imageDa =[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://cs.siam.edu:81/%@",[_dictForViewCon objectForKey:@"food_image"]]]];
    imageShow.image = [UIImage imageWithData:imageDa];
    dede.text=[_dictForViewCon objectForKey:@"food_introduction"];
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
    
    self.title = @"DetailFood";
    
}

@end
