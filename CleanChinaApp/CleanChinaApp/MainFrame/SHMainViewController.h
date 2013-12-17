//
//  MainViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/11/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"
#import "SHLoadingViewController.h"
#import "SHMainShowViewController.h"
@interface SHMainViewController : SHViewController
{
    __weak IBOutlet UIButton *mBtnYouk;
    __weak IBOutlet UIButton *mBtnBook;
    __weak IBOutlet UIButton *mBtnShow;
    __weak IBOutlet UIButton *mBtnBuss;
    __weak IBOutlet UIButton *mBtnNews;
    __weak IBOutlet UIView *mView;
    SHLoadingViewController * mLoadingViewController;
    SHMainShowViewController * mMainShowViewController;
    UINavigationController* mNavigationViewController;
    __weak IBOutlet UILabel *mLab5;
    __weak IBOutlet UILabel *mLab4;
    __weak IBOutlet UILabel *mLab3;
    __weak IBOutlet UILabel *mLab2;
    __weak IBOutlet UILabel *mLab1;
}
- (IBAction)btnShowOnTouch:(id)sender;
@end
