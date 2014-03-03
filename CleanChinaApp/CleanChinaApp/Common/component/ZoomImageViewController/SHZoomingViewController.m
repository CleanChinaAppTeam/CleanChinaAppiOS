//
//  SHZoomingViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 14-2-26.
//  Copyright (c) 2014年 sheely.paean.coretest. All rights reserved.
//

#import "SHZoomingViewController.h"

@interface SHZoomingViewController ()

@end

@implementation SHZoomingViewController

@synthesize URL;

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
    if(self.URL){
        SHHttpTask* task = [[SHHttpTask alloc]init];
        task.URL = self.URL;
        self.imgView.delegate = self;
        self.imgView.urlTask = task;
        [self showWaitDialogForNetWork];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnImgOnTouch:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    self.view.alpha = 0;
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidEnd)];
    [UIView commitAnimations];
  
}

- (void)animationDidEnd
{
    [self.view removeFromSuperview];
}

- (void) show
{
    self.view.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:self.view];
    [UIView beginAnimations:nil context:nil];
    self.view.alpha = 1;
    [UIView setAnimationDuration:0.8];
    [UIView commitAnimations];
}

- (void)imageViewDidLoadFinished:(SHImageView*)image
{
    
//    image.frame = CGRectMake(0, 0, image.image.size.width, image.image.size.height);
//    ((UIScrollView*)image.superview).contentSize = image.frame.size;
//    float scale = image.frame.size.height / self.view.frame.size.height;
//    scale = scale > image.frame.size.width / self.view.frame.size.width ? scale : image.frame.size.width / self.view.frame.size.width;
//    ((UIScrollView*)image.superview).zoomScale = 1/scale;
//    //((UIScrollView*)image.superview).minimumZoomScale = 1/scale;
    [self dismissWaitDialog];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [[scrollView subviews] objectAtIndex:0];
}


@end
