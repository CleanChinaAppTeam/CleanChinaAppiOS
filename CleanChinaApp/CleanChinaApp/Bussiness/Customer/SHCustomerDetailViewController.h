//
//  SHCustomerDetailViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/30/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"
#import "SHExhibitionFloorPlanViewController.h"

@interface SHCustomerDetailViewController : SHViewController <SHTaskDelegate>
{
    __weak IBOutlet UITextView *mTxtSummer;
    __weak IBOutlet UILabel *mLabName;
    __weak IBOutlet SHImageView *mImgLogo;
    __weak IBOutlet UILabel *mLabPhone;
    __weak IBOutlet UILabel *mLocation;
}
@property (weak, nonatomic) IBOutlet UIButton *btnShowLocation;

@property (nonatomic,copy) NSString * companyid;

@property (nonatomic,assign) BOOL hiddenShowLocation;
- (IBAction)btnLocationOnTouch:(id)sender;

@end
