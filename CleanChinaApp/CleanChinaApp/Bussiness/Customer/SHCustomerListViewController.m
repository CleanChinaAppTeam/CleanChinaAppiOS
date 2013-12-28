//
//  CustomerListViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/24/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHCustomerListViewController.h"

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
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
//    post.URL = URL_FOR(@"company&identication={\"type\":\"basic\",\"password\":\"test123\",\"username\":\"admin\",\"imei\":\"0a97e5810d5177a6\",\"info\":\"systemModel:iPad\",\"version\":\"1.2\"}&data={querykey:\"\"}");
//    //[post.postArgs setValue:@\"\" forKey:@\"querykey\"];
    post.URL = URL_FOR(@"function=company");
    post.delegate = self;
    [post start];
    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    
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
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = @"长江集团";
    return cell;
}
@end
