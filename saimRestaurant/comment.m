#import "HCSStarRatingView.h"
#import "comment.h"

@interface comment ()

@end

@implementation comment

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HCSStarRatingView *starRatingView = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(90, 200, 200, 50)];
    starRatingView.maximumValue = 5;
    starRatingView.minimumValue = 0;
    starRatingView.value = 4.5f;
    starRatingView.tintColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:1];
    [starRatingView addTarget:self action:@selector(didChangeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:starRatingView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didChangeValue:(HCSStarRatingView *)sender {
    NSLog(@"Changed rating to %.1f", sender.value);
}

@end
