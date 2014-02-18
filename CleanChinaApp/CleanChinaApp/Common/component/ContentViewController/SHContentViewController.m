//
//  SHContentViewController.m
//  siemens.bussiness.partner.CRM.tool
//
//  Created by sheely.paean.Nightshade on 10/31/13.
//  Copyright (c) 2013 MobilityChina. All rights reserved.
//

#import "SHContentViewController.h"

@interface SHContentViewController ()

@end

@implementation SHContentViewController

@synthesize func;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadSkin
{
    [super loadSkin];
    self.txtContent.userstyle = @"labmiddark";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtContent.text = self.content;
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(self.func);
    post.delegate = self;
    [post start];

    // Do any additional setup after loading the view from its nib.
}
- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    self.txtContent.text = [task.result valueForKey:@"img"];
    self.txtContent.userstyle = @"labmiddark";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}
@end
