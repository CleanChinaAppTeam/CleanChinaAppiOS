//
//  SHMainShowNavigationViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/23/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"
#import "SHGoupengViewController.h"
#import "SHAboutViewController.h"
#import "SHCustomerListViewController.h"
#import "SHPrizeViewController.h"
#import "SHExhibitionFloorPlanViewController.h"

@interface SHMainShowNavigationViewController : SHViewController
{
    
    __weak IBOutlet UIView *mViewBottom;
    SHAboutViewController * maboutviewcontroller;
    SHGoupengViewController *mgoupengviewcontroller;
    SHCustomerListViewController * customerlistviewcontroller;
    SHPrizeViewController * prizeviewcontroller;
    SHExhibitionFloorPlanViewController * mexhibitionviewcontroller;
}

@property (nonatomic,assign) int index;

- (IBAction)btnItemOnTouch:(id)sender;

@end
