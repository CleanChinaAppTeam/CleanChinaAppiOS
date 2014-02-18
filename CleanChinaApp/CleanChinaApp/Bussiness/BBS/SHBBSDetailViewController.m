//
//  SHBBSDetailViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHBBSDetailViewController.h"

@interface SHBBSDetailViewController ()

@end

@implementation SHBBSDetailViewController

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
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"forum1");
    [post.postArgs setValue:self.forum_id forKey:@"forum_id"];
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    mLabTitle.text = [task.result valueForKey:@"forum_name"];
    mLabAddress.text =  [NSString stringWithFormat:@"地点:%@", [task.result valueForKey:@"forum_address"]];
    mLabTime.text =  [NSString stringWithFormat:@"时间:%@", [task.result valueForKey:@"forum_date"]];
     mTxtSummary.text = [task.result valueForKey:@"fullDescr"];
    mTxtSummary.userstyle = @"labmidlight";
    [self dismissWaitDialog];
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
