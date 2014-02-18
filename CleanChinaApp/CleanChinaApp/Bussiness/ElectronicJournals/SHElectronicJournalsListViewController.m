//
//  SHElectronicJournalsListViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHElectronicJournalsListViewController.h"
#import "SHElectorDetailViewController.h"

@interface SHElectronicJournalsListViewController ()

@end

@implementation SHElectronicJournalsListViewController

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
    self.title = @"电子杂志";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"magazine1");
    [post.postArgs setValue:[NSNumber numberWithInt:2013]forKey:@"magazine_year"];
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = [NSString stringWithFormat:@"%d - %@",[[dic valueForKey:@"year"] integerValue],[dic valueForKey:@"period"]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHElectorDetailViewController * controller = [[SHElectorDetailViewController alloc] init];
    controller.magazine_id = [dic valueForKey:@"magazine_id"];
    controller.title =  [NSString stringWithFormat:@"%d - %@",[[dic valueForKey:@"year"] integerValue],[dic valueForKey:@"period"]];
   //controller.list =
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
