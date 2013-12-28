//
//  SHMainShowNavigationViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/23/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHMainShowNavigationViewController.h"
#import "SHAboutViewController.h"
#import "SHGoupengViewController.h"

@interface SHMainShowNavigationViewController ()

@end

@implementation SHMainShowNavigationViewController

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
    self.title = @"展会介绍";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.index = 0;
    // Do any additional setup after loading the view from its nib.
}

- (void)loadSkin
{
    [super loadSkin];
    mViewBottom.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorNavigationBackGround"];
}

- (void)setIndex:(int)index
{
    UIButton * button = [[UIButton alloc]init];
    button.tag = index;
    [self btnItemOnTouch:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnItemOnTouch:(UIButton*)sender
{
    
    SHViewController * controller ;
    if(sender.tag == 0){
        if(maboutviewcontroller == nil){
            maboutviewcontroller = [[SHAboutViewController alloc]init];
        }
        controller = maboutviewcontroller;
        
    }else if (sender.tag == 1){
        
        if(customerlistviewcontroller == nil){
            customerlistviewcontroller = [[SHCustomerListViewController alloc]init];
            
        }
        controller = customerlistviewcontroller;
    }
    else if (sender.tag == 4){
        if(mgoupengviewcontroller == nil){
            mgoupengviewcontroller = [[SHGoupengViewController alloc]init];
        }
        controller = mgoupengviewcontroller;
    }
    //controller.navigationController = self.navigationController;
    self.showBackItem = YES;
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    self.title = controller.title;
    CGRect frame = self.view.bounds;
    frame.size.height -= 50;
    controller.view.frame = frame;
}
@end
