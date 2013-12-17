//
//  MainShowViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/13/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHShowViewController.h"

@interface SHMainShowViewController : SHViewController
{
    
    __weak IBOutlet UIScrollView *mScroll;
    __weak IBOutlet UIView *mView;
   // UINavigationController * mController;
}
- (IBAction)btnAboutOnTouch:(id)sender;
- (IBAction)btnBack:(id)sender;
@end
