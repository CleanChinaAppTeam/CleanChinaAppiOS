//
//  MainViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/11/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHMainViewController.h"

@interface SHMainViewController ()

@end

@implementation SHMainViewController

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
    mLoadingViewController =  [[SHLoadingViewController alloc]init ];
    //[self addChildViewController:mLoadingViewController];
    [self.view addSubview:mLoadingViewController.view];
    [self animation];
    // Do any additional setup after loading the view from its nib.
}
- (void)animation
{
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:2];
    mBtnNews.frame = CGRectMake(4, 273, 46, 46  );
    mBtnBuss.frame = CGRectMake(50, 319, 58, 58  );
    mBtnShow.frame = CGRectMake(119,331, 83, 83  );
    mBtnBook.frame = CGRectMake(212, 319, 58, 58  );
    mBtnYouk.frame = CGRectMake(270, 273, 46, 46  );
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop)];
    [UIView commitAnimations];
}

- (void)animationDidStop
{
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.5];
    mLab1.alpha = 1;
    mLab2.alpha = 1;
    mLab3.alpha = 1;
    mLab4.alpha = 1;
    mLab5.alpha = 1;
    [UIView commitAnimations];
}

- (void)loadSkin
{
    [super loadSkin];
    mView.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorStyleCellSelected"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
