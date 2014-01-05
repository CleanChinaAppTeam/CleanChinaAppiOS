//
//  CustomerListViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/24/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHCustomerListViewController : SHTableViewController<SHTaskDelegate,UITextFieldDelegate>
{
    __weak IBOutlet UIButton *btnProduct;
    __weak IBOutlet UITextField *mTxtField;
    __weak IBOutlet UIButton *btnCharacter;
    NSNumber * mSearchType;
}
- (IBAction)btnCharacterOnTouch:(id)sender;
- (IBAction)btnProductOnTouch:(id)sender;
@end
