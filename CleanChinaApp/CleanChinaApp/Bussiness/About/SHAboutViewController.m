//
//  SHAboutViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/18/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHAboutViewController.h"
#import "SHIntroductionViewController.h"

@interface SHAboutViewController ()

@end

@implementation SHAboutViewController

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
    self.title = @"关于展会";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

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
        cell.labTitle.text = @"展会介绍";
    }else  if(indexPath.row == 1){
        cell.labTitle.text = @"如何参观";
    }else  if(indexPath.row == 2){
        cell.labTitle.text = @"酒店住宿";
    }else  if(indexPath.row == 3){
        cell.labTitle.text = @"免费班车";
    }else  if(indexPath.row == 4){
        cell.labTitle.text = @"停车服务";
    }else  if(indexPath.row == 5){
        cell.labTitle.text = @"现场服务";
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
    SHIntroductionViewController * controller = [[SHIntroductionViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
