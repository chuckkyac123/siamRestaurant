//
//  DetialViewController.h
//  saimRestaurant
//
//  Created by Noppadorn on 6/8/2558 BE.
//  Copyright (c) 2558 com.siamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetialViewController : UIViewController
{
    

    __weak IBOutlet UITextView *dede;
    IBOutlet UIImageView *imageShow;
    IBOutlet UILabel *textDetial;
}

@property (strong,nonatomic)NSDictionary *dictForViewCon;


@end
