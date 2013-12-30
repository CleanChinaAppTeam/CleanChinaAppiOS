//
//  SHTempletImageViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/31/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHTempletImageViewController.h"

@interface SHTempletImageViewController ()

@end

@implementation SHTempletImageViewController
@synthesize func;

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
    if(self.func.length > 0){
        [self showWaitDialogForNetWork];
        SHPostTaskM * post = [[SHPostTaskM alloc]init];
        post.URL = URL_FOR(self.func);
        post.delegate = self;
        [post start];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    SHHttpTask * t = [[SHHttpTask alloc]init ];
    t.URL  = [task.result valueForKey:@"img"];
    self.imgView.urlTask = t;
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
