//
//  SHPrizeViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/4/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHPrizeViewController.h"
#import "SHPrizeCustomListViewController.h"

@interface SHPrizeViewController ()

@end

@implementation SHPrizeViewController

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
    self.title = @"金钻奖";
    [self showWaitDialogForNetWork];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"rewardlist");
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    mList = (NSArray*)task.result;
    [self dismissWaitDialog];

    [self.tableView reloadData];
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

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mList.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = [dic valueForKey:@"reward_name"];
    return cell;
}

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHPrizeCustomListViewController * controller = [[SHPrizeCustomListViewController alloc]init];
    controller.rewardid = [dic valueForKey:@"reward_id"];
    controller.title = [dic valueForKey:@"reward_name"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
