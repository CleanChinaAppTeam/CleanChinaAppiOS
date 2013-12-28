//
//  MainShowViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/13/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHShowViewController.h"
#import "SHMainShowNavigationViewController.h"
#import "SHRegisterViewController.h"

@interface SHMainShowViewController : SHViewController
{
    
    __weak IBOutlet UIScrollView *mScroll;
    __weak IBOutlet UIView *mView;
   // UINavigationController * mController;
}
- (IBAction)btnGoupengOnTouch:(id)sender;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnOnTouch:(id)sender;
- (IBAction)btnRegisterOnTouch:(id)sender;
@end
