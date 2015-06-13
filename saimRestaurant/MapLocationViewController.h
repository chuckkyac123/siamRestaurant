//
//  MapLocationViewController.h
//  saimRestaurant
//
//  Created by Noppadorn on 6/8/2558 BE.
//  Copyright (c) 2558 com.siamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface MapLocationViewController : UIViewController<CLLocationManagerDelegate,GMSMapViewDelegate>
{
    IBOutlet NSMutableData *reData;
    IBOutlet UITableView *myTable;
    IBOutlet NSMutableArray *dataSelectMutArray;
}
@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
- (IBAction)Restaurant:(id)sender;

@end
