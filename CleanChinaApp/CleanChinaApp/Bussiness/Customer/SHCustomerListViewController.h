//
//  CustomerListViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/24/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHCustomerListViewController : SHTableViewController<SHTaskDelegate>
{
    __weak IBOutlet UITextField *mTxtField;
}
@end
