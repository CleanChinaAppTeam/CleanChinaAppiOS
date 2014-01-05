//
//  SHElectorDetailViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHElectorDetailViewController.h"
#import "SHElectrnicView.h"


@interface SHElectorDetailViewController ()

@end

@implementation SHElectorDetailViewController

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
    post.URL = URL_FOR(@"magazine");
    [post.postArgs setValue:self.magazine_id forKey:@"magazine_id"];
    post.delegate = self;
    [post start];
    self.scrollview.pagingEnabled = YES;
    self.scrollview.datasource = self;
    self.scrollview.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    mList = [task.result valueForKey:@"images"];
    [self.scrollview reloadData];
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

- (int) tableView:(SHTableHorizontalView *)tableView numberOfColumnInSection:(NSInteger)section
{
    return mList.count;
}

- (float) tableView:(SHTableHorizontalView *)tableView widthForColumnAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width;
}

- (SHTableHorizontalViewCell*) tableView:(SHTableHorizontalView *)tableView cellForColumnAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* url  = [mList objectAtIndex:indexPath.row];
    SHElectrnicView * view = [[[NSBundle mainBundle]loadNibNamed:@"SHElectrnicView" owner:Nil options:nil] objectAtIndex:0];
    SHHttpTask * task = [[SHHttpTask alloc]init];
    task.cachetype = CacheTypeTimes;
    task.URL = url;
    view.imageView.urlTask = task;
    return view;
}

@end
