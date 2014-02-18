//
//  SHSceneViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/1/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHSceneViewController.h"

@interface SHSceneViewController ()

@end

@implementation SHSceneViewController

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
    self.title = @"现场服务";
    //    self.navigationController.navigationController.navigationBar.backItem.title = @"";
    //    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // Do any additional setup after loading the view from its nib.
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    if(indexPath.row == 0){
        cell.labTitle.text = @"餐饮";
    }else  if(indexPath.row == 1){
        cell.labTitle.text = @"网络";
    }else  if(indexPath.row == 2){
        cell.labTitle.text = @"洗手间";
    }else  if(indexPath.row == 3){
        cell.labTitle.text = @"礼品";
    }else  if(indexPath.row == 4){
        cell.labTitle.text = @"主办方办公室";
    }else  if(indexPath.row == 5){
        cell.labTitle.text = @"VIP休息区";
    }
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        SHContentViewController * controller = [[SHContentViewController alloc]init];
        controller.title = @"餐饮";
        controller.func = @"expo5";
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1){
        SHContentViewController * controller = [[SHContentViewController alloc]init];
        controller.title = @"网络";
        controller.func = @"expo6";
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 2){
        SHContentViewController * controller = [[SHContentViewController alloc]init];
        controller.title = @"洗手间";
        controller.func = @"expo7";
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 3){
        SHContentViewController * controller = [[SHContentViewController alloc]init];
        controller.title = @"礼品";
        controller.func = @"expo8";
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 4){
        SHContentViewController * controller = [[SHContentViewController alloc]init];
        controller.title = @"主办方办公室";
        controller.func = @"expo9";
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 5){
        SHContentViewController * controller = [[SHContentViewController alloc]init];
        controller.title = @"VIP休息区";
        controller.func = @"expo10";
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
}
- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
    [task.respinfo show];
}
@end
