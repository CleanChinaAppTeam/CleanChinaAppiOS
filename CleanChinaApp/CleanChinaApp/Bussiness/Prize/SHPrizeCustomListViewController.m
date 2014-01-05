//
//  SHPrizeCustomListViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHPrizeCustomListViewController.h"
#import "SHCustomerDetailViewController.h"

@interface SHPrizeCustomListViewController ()

@end

@implementation SHPrizeCustomListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)taskDidFinished:(SHTask *)task
{
    mList = (NSArray*)task.result;
    [self.tableView reloadData];
    [self dismissWaitDialog];
}
- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
    [task.respinfo show];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"reward");
    [post.postArgs setValue:self.rewardid forKey:@"rewardid"];
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = [dic valueForKey:@"companyname"];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHCustomerDetailViewController * controller = [[SHCustomerDetailViewController alloc] init];
    controller.companyid = [[mList objectAtIndex:indexPath.row] valueForKey:@"companyid"];
    controller.title =  [[mList objectAtIndex:indexPath.row] valueForKey:@"companyname"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mList.count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
