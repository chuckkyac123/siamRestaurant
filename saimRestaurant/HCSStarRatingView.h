
@import UIKit;

IB_DESIGNABLE
@interface HCSStarRatingView : UIControl
@property (nonatomic) IBInspectable NSUInteger maximumValue;
@property (nonatomic) IBInspectable NSUInteger minimumValue;
@property (nonatomic) IBInspectable CGFloat value;
@property (nonatomic) IBInspectable CGFloat spacing;
@property (nonatomic) IBInspectable BOOL allowsHalfStars;
@end