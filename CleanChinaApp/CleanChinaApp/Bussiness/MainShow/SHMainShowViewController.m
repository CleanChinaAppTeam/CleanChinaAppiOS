//
//  MainShowViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/13/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHMainShowViewController.h"
#import "SHAboutViewController.h"
#import "SHGoupengViewController.h"
#import "SHPrizeViewController.h"
#import "SHBBSListViewController.h"

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
    mScroll.contentSize = CGSizeMake(320, 568);
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

- (IBAction)btnGoupengOnTouch:(id)sender
{
    SHMainShowNavigationViewController * controller = [[SHMainShowNavigationViewController alloc]init];
    controller.showBackItem = YES;
     [self.navigationController pushViewController:controller animated:YES];
}


- (IBAction)btnBack:(id)sender
{
    [self dismiss];
}

- (IBAction)btnOnTouch:(UIButton*)sender
{
    SHMainShowNavigationViewController * controller = [[SHMainShowNavigationViewController alloc]init];
     controller.showBackItem = YES;
    controller.index = sender.tag;
    [self.navigationController pushViewController:controller animated:YES];
    //NSLog (self.navigationController.navigationBar.backItem);
}

- (IBAction)btnRegisterOnTouch:(id)sender
{
    SHRegisterViewController * controller = [[SHRegisterViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnPrizeOnTouch:(id)sender
{
    SHPrizeViewController * controller = [[SHPrizeViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnBBSOnTouch:(id)sender
{
    SHBBSListViewController * controller  = [[SHBBSListViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)dismiss
{
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.5];
    //[super dismiss];
    CGRect frame = self.navigationController.view.frame;
    frame.origin.y = -frame.size.height;
    self.view.frame = frame;
    [UIView commitAnimations];
}

@end
