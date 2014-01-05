//
//  SHNewsDetailViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/4/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"
#import "SHImageContentViewController.h"

@interface SHNewsDetailViewController : SHImageContentViewController<SHTaskDelegate>
@property (nonatomic,copy) NSString * newsid;
@end
