//
//  SHBBSListViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHTableViewController.h"

@interface SHBBSListViewController : SHTableViewController
{
    
    __weak IBOutlet UIView *mViewBottom;
    __weak IBOutlet UITextField *mTxtField;
    __weak IBOutlet UIButton *btnClass;
    __weak IBOutlet UIButton *btnTimes;
    NSNumber * timesort;
    NSNumber * classsort;
    NSNumber * onlytody;
    __weak IBOutlet UIButton *btnSearch;

    __weak IBOutlet UIButton *btnToday;
}
- (IBAction)btnSearchOnTouch:(id)sender;
- (IBAction)btnClassOnTouch:(id)sender;
- (IBAction)btnTodayOnTouch:(id)sender;
- (IBAction)btnTimesOnTouch:(id)sender;
@end
