//
//  SHExhibitionFloorPlanViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/11/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHExhibitionFloorPlanViewController.h"
#import "SHCustomerDetailViewController.h"

@interface SHExhibitionFloorPlanViewController ()

@end

@implementation SHExhibitionFloorPlanViewController

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
    mView.backgroundColor = self.view.backgroundColor;
}
- (void)viewDidLoad
{
    self.title = @"展会平面图";
    [super viewDidLoad];
    NSMutableArray * array = [[NSMutableArray alloc]init];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]init];
    item.image = [UIImage imageNamed:@"ic_floor2"];
    [item setAction:@selector(btnAction1:)];
    item.target = self;
    [array addObject:item];
    
    item = [[UIBarButtonItem alloc]init];
    item.image = [UIImage imageNamed:@"ic_floor1"];
    [item setAction:@selector(btnAction2:)];
    item.target = self;
    [array addObject:item];
    self.navigationItem.rightBarButtonItems = array;
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.tag = 0 ;
    post.URL = URL_FOR(@"company3");
    post.delegate = self;
    [post start];
    SHPostTaskM * post2 = [[SHPostTaskM alloc]init];
    post2.tag = 2 ;
    post2.URL = URL_FOR(@"company2");
    post2.delegate = self;
    [post2 start];
    // Do any additional setup after loading the view from its nib.
}

- (void) btnAction1:(NSObject*)sender
{
    [UIView beginAnimations:nil context:Nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:mView cache:YES];
    mScrollView1.hidden = YES;
    mScrollView2.hidden = NO;
    [UIView commitAnimations];

}
- (void) btnAction2:(NSObject*)sender
{
    [UIView beginAnimations:nil context:Nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:mView cache:YES];
    mScrollView1.hidden = NO;
    mScrollView2.hidden = YES;
    [UIView commitAnimations];
    
}

- (void)taskDidFinished:(SHTask *)task
{
    if(task.tag == 0){
        SHHttpTask * taskimage = [[SHHttpTask alloc]init];
        taskimage.cachetype = CacheTypeTimes;
        taskimage.URL = [[((NSArray*)task.result ) objectAtIndex:0 ] valueForKey:@"zhanweiimg_url"];
        mImgView1.delegate = self;
        mImgView1.urlTask = taskimage;
        taskimage = [[SHHttpTask alloc]init];
        taskimage.cachetype = CacheTypeTimes;
        taskimage.URL = [[((NSArray*)task.result ) objectAtIndex:1 ] valueForKey:@"zhanweiimg_url"];
        mImgView2.delegate = self;
        mImgView2.urlTask = taskimage;
    }else if (task.tag == 2){
        mList = task.result;
        for (int i =0; i < mList.count;i++) {
            NSDictionary * dic = [mList objectAtIndex:i];
            UIButton * button = [[UIButton alloc]init];
            button.tag = i;
            button.frame = CGRectMake([[ [dic valueForKey:@"coordinate"] valueForKey:@"tlx"] integerValue], [[ [dic valueForKey:@"coordinate"] valueForKey:@"tly"] integerValue], [[ [dic valueForKey:@"coordinate"] valueForKey:@"brx"] integerValue]- [[ [dic valueForKey:@"coordinate"] valueForKey:@"tlx"] integerValue], [[ [dic valueForKey:@"coordinate"] valueForKey:@"bry"] integerValue]- [[ [dic valueForKey:@"coordinate"] valueForKey:@"tly"] integerValue]);
            //button.backgroundColor = [UIColor redColor];
            [button addTarget:self action:@selector(btnCustomerOnTouch:) forControlEvents:UIControlEventTouchUpInside];
            if([[dic valueForKey:@"zhanweiimg_id"] integerValue] ==1){
                
                [mImgView1 addSubview:button];
            }else{
                [mImgView2 addSubview:button];
                
            }
        }
    }
    
    [self dismissWaitDialog];
}

- (void) btnKxmenuOnTouch:(KxMenuItem *) button
{
    SHCustomerDetailViewController * controller = [[SHCustomerDetailViewController alloc] init];
    controller.companyid = [[mList objectAtIndex:button.tag] valueForKey:@"companyid"];
    controller.title =  [[mList objectAtIndex:button.tag] valueForKey:@"companyname"] ;
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (void)btnCustomerOnTouch:(UIButton*)sender
{
    NSDictionary * dic = [mList objectAtIndex:sender.tag];
    CGRect rect = [sender convertRect:sender.bounds toView:self.view];
    KxMenuItem* item = [[KxMenuItem alloc]init];
    item.tag = sender.tag;
    item.title = [dic valueForKey:@"companyname"];
    item.target = self;
    [item setAction:@selector(btnKxmenuOnTouch:)];
    NSArray* array  = [NSArray arrayWithObjects: item, nil];
    [KxMenu showMenuInView:self.view fromRect:rect menuItems:array];
}

- (void)imageViewDidLoadFinished:(SHImageView*)image
{

    image.frame = CGRectMake(0, 0, image.image.size.width, image.image.size.height);
    ((UIScrollView*)image.superview).contentSize = image.frame.size;
    float scale = image.frame.size.height / self.view.frame.size.height;
    scale = scale > image.frame.size.width / self.view.frame.size.width ? scale : image.frame.size.width / self.view.frame.size.width;
    ((UIScrollView*)image.superview).zoomScale = 1/scale;
    ((UIScrollView*)image.superview).minimumZoomScale = 1/scale;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [[scrollView subviews] objectAtIndex:0];
}

- (void)taskDidFailed:(SHTask *)task
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
