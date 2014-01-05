//
//  SHIntroductionViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/18/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHIntroductionViewController.h"

@interface SHIntroductionViewController ()

@end

@implementation SHIntroductionViewController

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
    self.title = @"展会介绍";
    [super viewDidLoad];
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"expo");
    post.delegate = self;
    [post start];
   // [post.postArgs setValue:@"" forKey:@""]
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    mLabAddress.text = [NSString stringWithFormat:@"地址:%@",[task.result valueForKey:@"address"]];
    mLabName.text = [task.result valueForKey:@"name"];
    mLabDate.text = [NSString stringWithFormat:@"日期:%@",[task.result valueForKey:@"date"]];
    mLabSummer.text = [task.result valueForKey:@"summary"];
    mLabSummer.userstyle = @"labmidlight";
    mLabWeb.text = [NSString stringWithFormat:@"网址:%@",[task.result valueForKey:@"website"]];
    //[mLabSummer sizeToFit];
}

-(void)loadSkin
{
    [super loadSkin];
    mLabSummer.userstyle = @"labmidlight";
}
 -(void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
}
@end
