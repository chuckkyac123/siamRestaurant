//
//  ViewController.h
//  saimRestaurant
//
//  Created by Noppadorn on 6/8/2558 BE.
//  Copyright (c) 2558 com.siamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet NSMutableData *reData;
    IBOutlet UITableView *myTable;
    IBOutlet NSMutableArray *dataSelectMutArray;
    
}

@end

