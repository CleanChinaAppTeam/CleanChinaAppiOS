//
//  SHGoupengViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 12/19/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "SHGoupengViewController.h"
#import "SHExhibitionFloorPlanViewController.h"

@interface SHGoupengViewController ()

@end

@implementation SHGoupengViewController

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
    mViewBottom.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorNavigationBackGround"];
    self.title = @"聚划算";
    self.navigationItem.rightBarButtonItems = [NSMutableArray arrayWithObjects:mBtnBar1,mBtnBar2, nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBarOnTouch:(id)sender
{
    SHExhibitionFloorPlanViewController * controller = [[SHExhibitionFloorPlanViewController alloc ]init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
