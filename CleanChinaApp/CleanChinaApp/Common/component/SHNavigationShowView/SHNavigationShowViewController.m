//
//  SHNavigationShowViewController.m
//  Zambon
//
//  Created by sheely on 13-9-7.
//  Copyright (c) 2013年 zywang. All rights reserved.
//

#import "SHNavigationShowViewController.h"

@interface SHNavigationShowViewController ()

@end

@implementation SHNavigationShowViewController
@synthesize isShow;

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
   
    // Do any additional setup after loading the view from its nib.
}

- (void)createNavi
{
    for (UIView * view in self.view.subviews) {
        [view removeFromSuperview];
    }
    mNavigationController = [[UINavigationController alloc]init];
    mNavigationController.navigationBar.translucent = NO;
    [mNavigationController.navigationBar setBackgroundImage:([[UIImage imageNamed:@"navigation_bar_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:10]) forBarMetrics:UIBarMetricsDefault];
    mNavigationController.navigationBar.backgroundColor = [UIColor blueColor];
    mNavigationController.navigationBar.clipsToBounds = YES;
    mNavigationController.delegate = self;
    mNavigationController.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mNavigationController.view];
    CGRect imgShade = self.view.bounds;
    imgShade.origin.x = -5;
    imgShade.size.width= 5;
    UIImageView*img = [[UIImageView alloc]initWithFrame:imgShade];
    
    img.image = [UIImage imageNamed:@"showview_left_shade"];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:img atIndex:0];

}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL) animated
{
    if(mNavigationController.viewControllers.count == 1){
        UIViewController * controller =  [mNavigationController.viewControllers objectAtIndex:0];
        controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCancel :self action:@selector(btnBack:)];
    }
}

- (void)btnBack:(NSObject * )object
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(navigationShowControllerDidDissmiss)]){
        [self.delegate navigationShowControllerDidDissmiss];
    }
    [self dismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)show : (UIViewController*)controller
{
    [self createNavi];
    [mNavigationController pushViewController:controller animated:NO];
}
- (void)show :(UIViewController*)controller  frame:(CGRect) frame inView:(UIView*)view
{
    if(self.isShow){
        return;
    }
    self.view.frame = frame;
    [self createNavi];
    self.view.alpha = 1;
    CGRect orRect = frame;
    orRect.origin.x = view.frame.size.width;
    self.view.frame = orRect;
    mNavigationController.view.frame = self.view.bounds;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.view.frame = frame;
    [mNavigationController pushViewController:controller animated:YES];
    [view addSubview:self.view];
    [UIView commitAnimations];
    self.isShow = YES;
}

-(void)dismiss
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDidStopSelector:@selector(btnAnimationDidStop)];
    self.view.alpha = 0;
    [UIView commitAnimations];
    self.isShow = NO;
}

- (void)btnAnimationDidStop
{
    [self.view removeFromSuperview];
}
@end
