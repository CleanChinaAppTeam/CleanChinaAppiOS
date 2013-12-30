//
//  SHIntroductionViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/18/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHIntroductionViewController : SHViewController<SHTaskDelegate>

{
    
    __weak IBOutlet UILabel *mLabName;
    __weak IBOutlet UILabel *mLabSummer;
    __weak IBOutlet UILabel *mLabWeb;
    __weak IBOutlet UILabel *mLabAddress;
    __weak IBOutlet UILabel *mLabDate;
}
@end
