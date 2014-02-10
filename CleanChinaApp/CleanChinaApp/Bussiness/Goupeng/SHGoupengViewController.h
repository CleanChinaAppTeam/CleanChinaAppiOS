//
//  SHGoupengViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/19/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHGoupengViewController : SHViewController
{
    
    IBOutlet UIBarButtonItem *mBtnBar2;
    IBOutlet UIBarButtonItem *mBtnBar1;
    __weak IBOutlet UIView *mViewBottom;
}
- (IBAction)btnBarOnTouch:(id)sender;
@end
