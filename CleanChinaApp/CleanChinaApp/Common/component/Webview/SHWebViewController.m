//
//  SHWebViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/1/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHWebViewController.h"

@interface SHWebViewController ()

@end

@implementation SHWebViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.webView setScalesPageToFit:YES];
    if(self.URL.length > 0){
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URL]]];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType
               :(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showWaitDialogForNetWork];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    [self dismissWaitDialog];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
     [self dismissWaitDialog];
}
@end
