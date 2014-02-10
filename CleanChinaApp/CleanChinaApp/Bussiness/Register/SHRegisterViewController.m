//
//  SHRegisterViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/26/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHRegisterViewController.h"

@interface SHRegisterViewController ()

@end

@implementation SHRegisterViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = @"观众登记";
    self.keybordView = self.view;
    self.keybordheight = 80;
    self.navigationItem.rightBarButtonItem = mBarButton;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSumbit:(id)sender
{
    if(mTxtName.text.length == 0){
        [self showAlertDialog:@"姓名没有填写"];
        return;
    }
    if(mTxtCompany.text.length == 0){
        [self showAlertDialog:@"公司名没有填写"];
        return;
    }
    if(mTxtEmail.text.length == 0){
        [self showAlertDialog:@"电子邮件没有填写"];
        return;
    }
    if(mtxtAdress.text.length == 0){
        [self showAlertDialog:@"联系地址没有填写"];
        return;
    }
    if(mTxtPhone.text.length == 0){
        [self showAlertDialog:@"联系手机没有填写"];
        return;
    }
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"person");
    [post.postArgs setValue:mTxtName.text forKey:@"name"];
    [post.postArgs setValue:mTxtCompany.text forKey:@"company"];
    [post.postArgs setValue:mtxtAdress.text forKey:@"address"];
    [post.postArgs setValue:mTxtProvince.text forKey:@"province"];
    [post.postArgs setValue:mTxtCity.text forKey:@"city"];
    [post.postArgs setValue:mTxtPhone.text forKey:@"mobile"];
    [post.postArgs setValue:mTxtEmail.text forKey:@"email"];
    post.delegate = self;
    [post start];
}

- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
    [task.respinfo show];
}

- (void)taskDidFinished:(SHTask *)task
{
    [self dismissWaitDialog];
    [task.respinfo show ];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
