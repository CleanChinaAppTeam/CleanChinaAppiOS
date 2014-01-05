//
//  SHNewsDetailViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/4/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHNewsDetailViewController.h"

@interface SHNewsDetailViewController ()

@end

@implementation SHNewsDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"SHImageContentViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    [self showWaitDialogForNetWork];
    post.URL = URL_FOR(@"newsdetail");
    [post.postArgs setValue:self.newsid forKey:@"news_id"];
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    self.labContent.text = [task.result valueForKey:@"news_content"];
    [self.labContent sizeToFit];
    if([[task.result valueForKey:@"news_img"] length] > 0){
        SHHttpTask * _task = [[SHHttpTask alloc]init];
        _task.URL = [task.result valueForKey:@"news_img"];
        self.imgView.urlTask = _task;
        CGRect frame = self.labContent.frame;
        frame.origin.y = 8;
    }
    self.scrollView.contentSize = CGSizeMake(320, self.labContent.frame.origin.y + self.labContent.frame.size.height);
  
}

- (void)loadSkin
{
    [super loadSkin];
    self.labContent.userstyle = @"labmidlight";
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
