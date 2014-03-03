//
//  SHExhibitionFloorPlanViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/11/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHExhibitionFloorPlanViewController : SHViewController<SHTaskDelegate,SHImageViewDelegate>
{
    __weak IBOutlet UIView *mView;
    __weak IBOutlet UIScrollView *mScrollView2;
    __weak IBOutlet SHImageView *mImgView2;
    __weak IBOutlet SHImageView *mImgView1;
    __weak IBOutlet UIScrollView *mScrollView1;
    NSArray * mList;
}

    @property (nonatomic,copy) NSString * companyid;
@end
