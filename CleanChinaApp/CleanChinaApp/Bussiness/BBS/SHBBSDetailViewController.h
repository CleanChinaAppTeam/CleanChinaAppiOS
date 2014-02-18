//
//  SHBBSDetailViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHBBSDetailViewController : SHViewController<SHTaskDelegate>
{
    __weak IBOutlet UILabel *mLabTitle;
    __weak IBOutlet UILabel *mLabTime;
    __weak IBOutlet UILabel *mLabAddress;
    __weak IBOutlet UITextView *mTxtSummary;
}

@property (nonatomic,copy) NSString * forum_id;
@end
