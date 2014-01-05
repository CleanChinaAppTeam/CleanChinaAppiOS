//
//  SHTempletImageViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/31/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHTempletImageViewController : SHViewController <SHTaskDelegate>
@property (weak, nonatomic) IBOutlet SHImageView *imgView;
@property (copy,nonatomic) NSString * func;
@property (nonatomic,assign) BOOL hidwait;
@end
