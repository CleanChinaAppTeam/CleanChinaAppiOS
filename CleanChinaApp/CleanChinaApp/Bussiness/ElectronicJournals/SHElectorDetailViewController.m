//
//  SHElectorDetailViewController.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHElectorDetailViewController.h"
#import "SHElectrnicView.h"


@interface SHElectorDetailViewController ()

@end

@implementation SHElectorDetailViewController

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
    [self showWaitDialogForNetWork];
    SHPostTaskM * post = [[SHPostTaskM alloc]init];
    post.URL = URL_FOR(@"magazine");
    [post.postArgs setValue:self.magazine_id forKey:@"magazine_id"];
    post.delegate = self;
    [post start];
    
    [self.collectView registerNib:[UINib nibWithNibName:@"SHElectrnicView" bundle:nil] forCellWithReuseIdentifier:@"default"];    // Do any additional setup after loading the view from its nib.
}

- (void)taskDidFinished:(SHTask *)task
{
    mList = [task.result valueForKey:@"images"];
    [self.collectView reloadData];
    [self dismissWaitDialog];
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




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return mList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* url  = [mList objectAtIndex:indexPath.row];
    SHElectrnicView * view = [collectionView dequeueReusableCellWithReuseIdentifier:@"default" forIndexPath:indexPath];
    SHHttpTask * task = [[SHHttpTask alloc]init];
    task.cachetype = CacheTypeTimes;
    task.URL = url;
    view.imageView.urlTask = task;
    return view;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    controller = [[SHZoomingViewController alloc]init];
    NSString* url  = [mList objectAtIndex:indexPath.row];
    controller.URL = url;
    [controller show];

}
@end
