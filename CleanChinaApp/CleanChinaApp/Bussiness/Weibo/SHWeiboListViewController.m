//
//  SHWeiboListViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/6/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHWeiboListViewController.h"
#import "SHWeiboView.h"
@interface SHWeiboListViewController ()

@end

@implementation SHWeiboListViewController

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
    self.title = @"微博列表";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    mDic = [[NSMutableDictionary alloc]init];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"weibo");
    [post.postArgs setValue:[NSNumber numberWithInt:0] forKey:@"lessthan_wbid"];
    [post.postArgs setValue:[NSNumber numberWithInt:20] forKey:@"pagesize"];
    post.delegate = self;
    [post start];

    // Do any additional setup after loading the view from its nib.
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    SHWeiboView * view = [[[NSBundle mainBundle]loadNibNamed:@"SHWeiboView" owner:Nil options:Nil] objectAtIndex:0];
    view.labTitle.text = [dic valueForKey:@"weibo_content"];
    view.labTime.text = [dic valueForKey:@"weibo_submittime"];
    if([[dic valueForKey:@"images"] count ]>0){
        if([[[dic valueForKey:@"images"] objectAtIndex:0] length] > 0 ){
           // NSNumber *height = [mDic valueForKey:[NSString  stringWithFormat:@"%d",indexPath.row]];
           // if(height == nil){
                SHHttpTask * task = [[SHHttpTask alloc]init];
                task.URL = [[dic valueForKey:@"images"] objectAtIndex:0];
                task.cachetype = CacheTypeTimes;
                view.imgView.delegate = self;
                view.imgView.tag = indexPath.row;
                view.imgView.urlTask = task;
            
              
          //  }
        }
    }
    return view;
}
- (void) imageViewDidLoadFinished:(SHImageView*) imageview
{
    int height = imageview.image.size.height * 170/imageview.image.size.width;
    NSNumber *numheight = [mDic valueForKey:[NSString  stringWithFormat:@"%d",imageview.tag]];
    if(numheight == nil){

    [mDic  setValue:[NSNumber numberWithInt:height] forKey:[NSString stringWithFormat:@"%d",imageview.tag]];
        [self performSelector:@selector(refresh:) withObject:[NSIndexPath indexPathForRow:imageview.tag inSection:0] afterDelay:0.1];
    }
}

- (void)refresh:(NSIndexPath *) index
{
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationFade];
    
}
- (void)taskDidFailed:(SHTask *)task
{
    [self dismissWaitDialog];
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mList.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [mList objectAtIndex:indexPath.row];
    if([[dic valueForKey:@"images"] count ]>0){
        if([[[dic valueForKey:@"images"] objectAtIndex:0] length] > 0 ){
            NSNumber *height = [mDic valueForKey:[NSString  stringWithFormat:@"%d",indexPath.row]];
            if(height == nil){
                return 100;
            }else{
                return 100 + height.floatValue;
            }
        }
    }
    return 100;
}

- (void)taskDidFinished:(SHTask *)task
{
    mList = task.result;
    [self.tableView reloadData];
    [self dismissWaitDialog];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
