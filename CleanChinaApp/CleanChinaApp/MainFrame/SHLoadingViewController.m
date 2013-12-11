//
//  SHLoadingViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/1/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHLoadingViewController.h"

@interface SHLoadingViewController ()

@end

@implementation SHLoadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIView beginAnimations:Nil context:nil];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:0.5];
    CGRect frame = mImgWave.frame;
    frame.origin.x = -512;
    mImgWave.frame = frame;
    frame = mImgMaxBubble.frame;
    frame.origin.y = 60;
    mImgMaxBubble.frame = frame;
    mImgMinBubble.frame = frame;
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self dismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
