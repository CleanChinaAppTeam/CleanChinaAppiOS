//
//  SHImageContentViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/3/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHImageContentViewController : SHViewController
@property (weak, nonatomic) IBOutlet SHImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *labContent;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
