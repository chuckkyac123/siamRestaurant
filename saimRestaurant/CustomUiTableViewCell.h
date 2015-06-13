//
//  CustomUiTableViewCell.h
//  saimRestaurant
//
//  Created by Noppadorn on 6/8/2558 BE.
//  Copyright (c) 2558 com.siamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomUiTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIImageView *imageFood;
@property (strong, nonatomic) IBOutlet UILabel *foodName;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UIImageView *likePoint;

@end
