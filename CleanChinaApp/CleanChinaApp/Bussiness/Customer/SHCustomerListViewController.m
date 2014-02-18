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
    mSearchType = [NSNumber numberWithInt:1];
    self.title = @"展商查询";
    [self request:@""];
    btnCharacter.selected = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)request:(NSString*) msg;
{
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"company");
    [post.postArgs setValue:msg forKey:@"querykey"];
    [post.postArgs setValue:mSearchType forKey:@"sortby"];
    post.delegate = self;
    [post start];
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    mSelectSection = 0;
    mList = (NSArray*)task.result;
    [self.tableView reloadData];
}
- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
}


- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary * dic = [mList objectAtIndex:section];
    UIButton * lab = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 28)];
    lab.backgroundColor = [UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1];
//    lab.textAlignment = NSTextAlignmentLeft;
    lab.userstyle = @"labmiddark";
    [lab setTitle: [NSString stringWithFormat:@"   %@",[dic valueForKey:@"sectionname"]] forState:UIControlStateNormal] ;
    lab.tag = section;
    [lab setTitleColor:[UIColor colorWithRed:61/255.0 green:61/255.0 blue:61/255.0 alpha:1] forState:UIControlStateNormal];
    lab.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [lab addTarget:self action:@selector(btnOnTouch:) forControlEvents:UIControlEventTouchUpInside];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor lightTextColor];
    [lab addSubview:view];
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 28, 320, 1)];
    view.backgroundColor = [UIColor lightTextColor];
    [lab addSubview:view];
    return lab;
}

- (void)btnOnTouch:(UIButton*)sender
{
    mSelectSection = sender.tag;
    [self.tableView reloadSections:  [NSIndexSet indexSetWithIndex:mSelectSection]  withRowAnimation:UITableViewRowAnimationFade];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *key = [[mList objectAtIndex:section] valueForKey:@"sectionname"];
    return key;
    
}


- (float) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 28;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(section == mSelectSection){
        NSDictionary * dic = [mList objectAtIndex:section];
        return [[dic valueForKey:@"company"] count];
//    }else{
//        return 0;
//    }
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return mList.count;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == mSelectSection){
        return 36;
    }else{
        return 0;
    }

}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [[[mList objectAtIndex:indexPath.section] valueForKey:@"company"] objectAtIndex:indexPath.row];
    SHTableViewGeneralCell * cell = [tableView dequeueReusableGeneralCell];
    cell.labTitle.userstyle = @"labmidlight";
    cell.labTitle.text = [dic valueForKey:@"companyname"];
    return cell;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    
//    NSArray * array = [mList valueForKey:@"sectionname"];
//    return array;
//    
//}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHCustomerDetailViewController * controller = [[SHCustomerDetailViewController alloc] init];
    controller.companyid = [[[[mList objectAtIndex:indexPath.section] valueForKey:@"company"] objectAtIndex:indexPath.row] valueForKey:@"companyid"];
    controller.title =  [[[[mList objectAtIndex:indexPath.section] valueForKey:@"company"] objectAtIndex:indexPath.row] valueForKey:@"companyname"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)btnCharacterOnTouch:(id)sender
{
    btnCharacter.selected = YES;
    btnProduct.selected = NO;
    mSearchType = [NSNumber numberWithInt:1];
    mTxtField.text = @"";
    [self request:mTxtField.text];
}

- (IBAction)btnProductOnTouch:(id)sender
{
    btnCharacter.selected = NO;
    btnProduct.selected = YES;
    mSearchType = [NSNumber numberWithInt:2];
    mTxtField.text = @"";
    [self request:mTxtField.text];

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self request:mTxtField.text];
}
// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [mTxtField resignFirstResponder];
}
@end
