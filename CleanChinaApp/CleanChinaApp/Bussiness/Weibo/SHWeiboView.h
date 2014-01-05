//
//  SHWeiboView.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/6/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHTableViewCell.h"

@interface SHWeiboView : SHTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet SHImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *labTime;

@end
