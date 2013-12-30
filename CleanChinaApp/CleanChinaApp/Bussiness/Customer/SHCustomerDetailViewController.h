//
//  SHCustomerDetailViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/30/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHCustomerDetailViewController : SHViewController <SHTaskDelegate>
{
    __weak IBOutlet UITextView *mTxtSummer;
    __weak IBOutlet UILabel *mLabName;
    __weak IBOutlet SHImageView *mImgLogo;
    __weak IBOutlet UILabel *mLabPhone;
}

@property (nonatomic,copy) NSString * companyid;

@end
