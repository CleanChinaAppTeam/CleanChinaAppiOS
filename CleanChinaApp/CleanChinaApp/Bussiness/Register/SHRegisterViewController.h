//
//  SHRegisterViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/26/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHRegisterViewController : SHViewController < SHTaskDelegate>

{
    
    IBOutlet UIBarButtonItem *mBarButton;
    __weak IBOutlet UITextField *mTxtEmail;
    __weak IBOutlet UITextField *mTxtPhone;
    __weak IBOutlet UITextField *mtxtAdress;
    __weak IBOutlet UITextField *mTxtCity;
    __weak IBOutlet UITextField *mTxtProvince;
    __weak IBOutlet UITextField *mTxtCompany;
    __weak IBOutlet UITextField *mTxtName;
}
- (IBAction)btnSumbit:(id)sender;
@end
