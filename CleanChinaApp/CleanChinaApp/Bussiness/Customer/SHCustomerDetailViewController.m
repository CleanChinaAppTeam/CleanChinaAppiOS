//
//  SHCustomerDetailViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/30/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHCustomerDetailViewController.h"

@interface SHCustomerDetailViewController ()

@end

@implementation SHCustomerDetailViewController

@synthesize companyid;

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
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"company1");
    [post.postArgs setValue:self.companyid forKey:@"companyid"];
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    if([[task.result valueForKey:@"logo"] length] > 0){
        SHHttpTask * task2 = [[SHHttpTask alloc] init ];
        task2.URL =[task.result valueForKey:@"logo"];
        mImgLogo.urlTask = task2;
    }
    mLabPhone.text = [NSString stringWithFormat:@"电话:%@", [task.result valueForKey: @"tele"]];
    mLabName.text = [task.result valueForKey:@"companyname"];
    mTxtSummer.text = [task.result valueForKey:@"summary"];
    mTxtSummer.userstyle= @"labmidlight";
}

- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
