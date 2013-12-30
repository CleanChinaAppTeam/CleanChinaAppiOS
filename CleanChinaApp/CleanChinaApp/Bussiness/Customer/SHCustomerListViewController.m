//
//  CustomerListViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/24/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHCustomerListViewController.h"
#import  "SHCustomerDetailViewController.h"
@interface SHCustomerListViewController ()

@end

@implementation SHCustomerListViewController

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
    self.title = @"展商查询";
    [self request:@""];
    // Do any additional setup after loading the view from its nib.
}

- (void)request:(NSString*) msg;
{
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"company");
    [post.postArgs setValue:msg forKey:@"querykey"];
    post.delegate = self;
    [post start];
}

- (void)taskDidFinished:(SHTask *)task
{
    mList = task.result;
    [self.tableView reloadData];
}
- (void)taskDidFailed:(SHTask *)task
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary * dic = [mList objectAtIndex:section];
    return [[dic valueForKey:@"company"] count];
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return mList.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [[[mList objectAtIndex:indexPath.section] valueForKey:@"company"] objectAtIndex:indexPath.row];
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = [dic valueForKey:@"companyname"];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHCustomerDetailViewController * controller = [[SHCustomerDetailViewController alloc] init];
    controller.companyid = [[[[mList objectAtIndex:indexPath.section] valueForKey:@"company"] objectAtIndex:indexPath.row] valueForKey:@"companyid"];
    controller.title =  [[[[mList objectAtIndex:indexPath.section] valueForKey:@"company"] objectAtIndex:indexPath.row] valueForKey:@"companyname"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
