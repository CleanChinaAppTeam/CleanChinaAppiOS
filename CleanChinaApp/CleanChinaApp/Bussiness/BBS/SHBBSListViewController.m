//
//  SHBBSListViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHBBSListViewController.h"
#import "SHBBSDetailViewController.h"
@interface SHBBSListViewController ()

@end

@implementation SHBBSListViewController

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
    classsort = [NSNumber numberWithInt:0];
    timesort =[NSNumber numberWithInt:1];
    onlytody =[NSNumber numberWithInt:0];
    self.title = @"行业论坛";
    [self request];
    btnSearch.selected = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)request;
{
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"forum");
    [post.postArgs setValue:onlytody forKey:@"onlygettodayforum"];
    [post.postArgs setValue:mTxtField.text forKey:@"querykey"];
    [post.postArgs setValue:timesort forKey:@"timesort"];
    [post.postArgs setValue:[NSNumber numberWithInt:0] forKey:@"timesorttype"];
    [post.postArgs setValue:classsort forKey:@"classsort"];
    [post.postArgs setValue:[NSNumber numberWithInt:0] forKey:@"classsorttype"];
    post.delegate = self;
    [post start];
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    mList = (NSArray*)task.result;
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

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mList.count;
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = [dic valueForKey:@"forum_name"];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHBBSDetailViewController * controller = [[SHBBSDetailViewController alloc]init];
    controller.forum_id = [dic valueForKey:@"forum_id"];
    controller.title = [dic valueForKey:@"forum_name"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self request];
}
// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [mTxtField resignFirstResponder];
}

- (void)loadSkin
{
    [super loadSkin];
    mViewBottom.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorNavigationBackGround"];
    self.tableView.backgroundColor = self.view.backgroundColor;
}

- (IBAction)btnClassOnTouch:(id)sender
{
    btnClass.selected = YES;
    btnTimes.selected = NO;
    classsort = [NSNumber numberWithInt:1];
    timesort =[NSNumber numberWithInt:0];

    mTxtField.text = @"";
    [self request];

}

- (IBAction)btnTodayOnTouch:(id)sender
{
    onlytody =[NSNumber numberWithInt:1];
    btnSearch.selected = NO;
    btnToday.selected = YES;
    CGRect frame = self.tableView.frame ;
    frame.origin.y = 0;
    frame.size.height = self.view.frame.size.height - 54;
    self.tableView.frame = frame;
    [self request];
}
- (IBAction)btnSearchOnTouch:(id)sender
{
    onlytody =[NSNumber numberWithInt:0];
    btnSearch.selected = YES;
    btnToday.selected = NO;
    CGRect frame = self.tableView.frame ;
    frame.origin.y = 49;
    frame.size.height = self.view.frame.size.height - 54 -49;
    self.tableView.frame = frame;
    [self request];
}

- (IBAction)btnTimesOnTouch:(id)sender
{
    btnClass.selected = NO;
    btnTimes.selected = YES;
    classsort = [NSNumber numberWithInt:0];
    timesort =[NSNumber numberWithInt:1];

    mTxtField.text = @"";
    [self request];
}
@end
