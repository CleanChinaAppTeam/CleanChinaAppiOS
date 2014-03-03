//
//  SHZoomingViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 14-2-26.
//  Copyright (c) 2014年 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHZoomingViewController : SHViewController

@property (weak, nonatomic) IBOutlet SHImageView *imgView;

@property (nonatomic,copy) NSString* URL;

- (IBAction)btnImgOnTouch:(id)sender;

- (void) show;
@end
