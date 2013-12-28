//
//  SHRegisterViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/26/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHRegisterViewController.h"

@interface SHRegisterViewController ()

@end

@implementation SHRegisterViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = @"观众登记";
    self.keybordView = self.view;
    self.keybordheight = 50;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
