//
//  SHNewsViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/3/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHNewsViewController.h"
#import "SHNewsDetailViewController.h"
#import "SHNewsCell.h"

@interface SHNewsViewController ()

@end

@implementation SHNewsViewController

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
    self.title = @"行业新闻";
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"news");
    [post.postArgs setValue:[NSNumber numberWithInteger:-1] forKey:@"lessthan_newsid"];
    [post.postArgs setValue:[NSNumber numberWithInteger:20] forKey:@"pagesize"];
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHNewsCell * cell =  [[[NSBundle mainBundle]loadNibNamed:@"SHNewsCell" owner:Nil options:Nil] objectAtIndex:0];
    if([[dic valueForKey:@"news_img"] length] >0){
        SHHttpTask * task = [[SHHttpTask alloc]init];
        task.URL = [dic valueForKey:@"news_img"];
        task.cachetype = CacheTypeTimes;
        cell.imgView.urlTask = task;
    }else{
        CGRect rect = cell.labTitle.frame;
        rect.origin.x = 5;
        rect.size.width = 310;
        cell.labTitle.frame = rect;
    }
    cell.labTitle.userstyle = @"labmiddark";
    cell.labTitle.text = [dic valueForKey:@"news_title"];
    [cell.labTitle sizeToFit];
    
//    cell.labTitle.text = [dic valueForKey:@"news_title"];
//    cell.labContent.text = [dic valueForKey:@"news_date"];

    return cell;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mList.count;
}

- (void)taskDidFinished:(SHTask *)task
{
    mList = task.result;
    [self.tableView reloadData];
    [self dismissWaitDialog];
}

- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHNewsDetailViewController * controller = [[SHNewsDetailViewController alloc]init  ];
    controller.title = [dic valueForKey:@"news_title"];
    controller.newsid = [dic valueForKey:@"news_id"];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
