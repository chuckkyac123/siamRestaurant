//
//  MapLocationViewController.m
//  saimRestaurant
//
//  Created by Noppadorn on 6/8/2558 BE.
//  Copyright (c) 2558 com.siamu. All rights reserved.
//

#import "MapLocationViewController.h"

@interface MapLocationViewController ()

@end

@implementation MapLocationViewController {
    GMSMapView *mapView_;
    GMSMarker *melbourneMarker_;
    NSDictionary *dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSelectMutArray =[[NSMutableArray alloc]init];
    NSString *post;
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",[postData length]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cs.siam.edu:81/select_res.php"]];
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
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:13.7206763
                                                            longitude:100.665269
                                                                 zoom:9.5];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.delegate = self;
    self.view = mapView_;
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
    for(int i=0;i< [dataSelectMutArray count];i++){
    dict = [dataSelectMutArray objectAtIndex:i];
        melbourneMarker_ = [[GMSMarker alloc] init];
        NSString* a=[dict objectForKey:@"restaurant_latitude"];
        NSString* b=[dict objectForKey:@"restaurant_longitude"];
        float a1=[a floatValue];
        float b1=[b floatValue];
        melbourneMarker_.position = CLLocationCoordinate2DMake(a1,b1);
        melbourneMarker_.map = mapView_;
    }
    mapView_.delegate = self;
    self.view = mapView_;
}

#pragma mark - GMSMapViewDelegate

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker
{
    if (marker == melbourneMarker_)
    {
        return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon"]];
    }
    
    return nil;
}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
    
    // Animate to the marker
    [CATransaction begin];
    [CATransaction setAnimationDuration:3.f];  // 3 second animation
    
    /*if([[segue identifier]isEqualToString:@"FoodDetial"]){
     NSIndexPath *indexPath = [myTable indexPathForSelectedRow];
     dict = [dataSelectMutArray objectAtIndex:indexPath.row];
     
     [[segue destinationViewController]setDictForViewCon:dict];
     }*/
    //dataSelectMutArray
    NSString *latitude= [NSString stringWithFormat:@"%f",marker.position.latitude];
    NSString *longitude= [NSString stringWithFormat:@"%f",marker.position.longitude];
    
    for(int i=0;i<[dataSelectMutArray count];i++){
    //for(GMSMarker *marker in dataSelectMutArray) {
        dict = [dataSelectMutArray objectAtIndex:i];
        melbourneMarker_ = [[GMSMarker alloc] init];
        NSString* a=[dict objectForKey:@"restaurant_latitude"];
        NSString* b=[dict objectForKey:@"restaurant_longitude"];
        NSLog(@"56589498415649416519 %@ %@",a,b);
        if([a isEqual:@"%@"],latitude && [b isEqual:@"%@"],longitude){
            NSLog(@"56589498415649416518 %@ %@",latitude,longitude);
            break;
        } else {
            NSLog(@"56589498415649416517 %@ %@",latitude,longitude);
        }
    }
    [CATransaction commit];
    if (marker == melbourneMarker_ &&
        mapView.selectedMarker != melbourneMarker_) {
        return NO;
    }
    //[self performSegueWithIdentifier:@"Restaurant" sender:self];
    // The Tap has been handled so return YES
    return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //[dict objectForKey:@"food_image"]
    
    if([[segue identifier]isEqualToString:@"FoodDetial"]){
        NSIndexPath *indexPath = [myTable indexPathForSelectedRow];
        dict = [dataSelectMutArray objectAtIndex:indexPath.row];
        
        //[[segue destinationViewController]setDictForViewCon:dict];
    }
    
}



- (IBAction)Restaurant:(id)sender {
    }
@end
