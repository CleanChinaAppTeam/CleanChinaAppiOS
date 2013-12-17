//
//  MainShowViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/13/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHMainShowViewController.h"
#import "SHAboutViewController.h"

@interface SHMainShowViewController ()

@end

@implementation SHMainShowViewController

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
   
    //mController.navigationBarHidden = YES;
     //mController.view.userInteractionEnabled = NO;
    //[mController.view addSubview:self.view];
    //[self.view addSubview:mController.view];
    //[self.view addSubview:mController.view];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    mScroll.contentOffset = CGPointMake(0, 0);
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

- (IBAction)btnAboutOnTouch:(id)sender
{
    SHAboutViewController * controller = [[SHAboutViewController alloc]init];
    //controller.view;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnBack:(id)sender
{
    [self dismiss];
}
-(void)dismiss
{
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.5];
    //[super dismiss];
    CGRect frame = self.navigationController.view.frame;
    frame.origin.y = -frame.size.height;
    self.navigationController.view.frame = frame;
    [UIView commitAnimations];
}

@end
