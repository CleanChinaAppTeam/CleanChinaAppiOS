//
//  SHElectorDetailViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/5/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHElectorDetailViewController : SHViewController<SHTableHorizontalViewDataSource,SHTaskDelegate, SHTableHorizontalViewDelegate>
{
    NSArray * mList;
}
@property (weak, nonatomic) IBOutlet SHTableHorizontalView *scrollview;
@property (nonatomic,retain) NSString * magazine_id;


@end
