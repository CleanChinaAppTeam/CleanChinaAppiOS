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
    if(self.view){
        UIButton * button = [mViewBottom.subviews objectAtIndex:index];
        //button.tag = index;
        [self btnItemOnTouch:button];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnItemOnTouch:(UIButton*)sender
{
    for (UIButton * view in mViewBottom.subviews) {
        if([view isKindOfClass:[UIButton class]]){
            view.selected = NO;
        }
    }
    sender.selected = YES;
    
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
    else if (sender.tag == 2){
        if(mexhibitionviewcontroller == nil){
            mexhibitionviewcontroller = [[SHExhibitionFloorPlanViewController alloc]init];
        }
        controller = mexhibitionviewcontroller;
    }
    else if (sender.tag == 3){
        if(prizeviewcontroller == nil){
            prizeviewcontroller = [[SHPrizeViewController alloc]init];
        }
        controller = prizeviewcontroller;
    }
    
    //controller.navigationController = self.navigationController;
    controller.showBackItem = YES;

    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.backgroundColor = self.view.backgroundColor;
    self.title = controller.title;
    self.navigationItem.rightBarButtonItems = controller.navigationItem.rightBarButtonItems;
    CGRect frame = self.view.bounds;
    frame.size.height -= 50;
    controller.view.frame = frame;
}
@end
