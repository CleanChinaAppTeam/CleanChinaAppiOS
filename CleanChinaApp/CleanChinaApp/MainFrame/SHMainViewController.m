//
//  MainViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/11/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHMainViewController.h"
#import "SHMainShowViewController.h"
#import "SHNewsViewController.h"
#import "SHElectronicJournalsListViewController.h"

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
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"advertise");
    post.delegate = self;
    [post start];
    //[self addChildViewController:mLoadingViewController];
    [self.view addSubview:mLoadingViewController.view];
    [self performSelector:@selector(loadAdvertise) withObject:Nil afterDelay:3.1];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadAdvertise
{
    if(mAdViewController){
        [UIView beginAnimations:nil context:Nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        [self.view addSubview:mAdViewController.view];
        [UIView commitAnimations];
        [self performSelector:@selector(animation) withObject:Nil afterDelay:3];
    }else{
        [self animation];
    }
}


- (void)taskDidFailed:(SHTask *)task
{
}

- (void)taskDidFinished:(SHTask *)task
{
    mAdViewController = [[SHTempletImageViewController alloc]init];
    mAdViewController.func = @"advertise";
    mAdViewController.hidwait = YES;
    mAdViewController.view;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)animation
{
    [UIView beginAnimations:nil context:Nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    [mAdViewController.view removeFromSuperview];
    [UIView commitAnimations];

    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDelay:1];
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
    mView.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorBackGround"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNewsOnTouch:(id)sender
{
    SHNewsViewController * controller = [[SHNewsViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnBussinessOnTouch:(id)sender
{
    SHWebViewController * controller = [[SHWebViewController alloc]init];
    controller.title = @"清洁用品商城";
    controller.URL = @"http://www.chinacleanexpo.com/Home/tabid/958/language/zh-CN/Default.aspx";
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnShowOnTouch:(id)sender
{


    mMainShowViewController = [[SHMainShowViewController alloc]init];
    [self addChildViewController:mMainShowViewController];
    [self.view addSubview:mMainShowViewController.view];
    CGRect frame = mMainShowViewController.view.frame;
    frame.origin.y = -frame.size.height;
    mMainShowViewController.view.frame = frame;
    frame.origin.y = 0;
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.5];
    mMainShowViewController.view.frame = frame;
    [UIView commitAnimations];
}

- (IBAction)btnBookOnTouch:(id)sender
{
    SHElectronicJournalsListViewController * controller = [[SHElectronicJournalsListViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
