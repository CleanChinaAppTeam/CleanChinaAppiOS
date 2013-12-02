//
//  SHTableViewCell.h
//  Zambon
//
//  Created by sheely on 13-9-6.
//  Copyright (c) 2013年 zywang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHTableViewCell : UITableViewCell<ISHSkin>

- (void) alternate :(NSIndexPath*) indexpath;
@end
