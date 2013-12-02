//
//  SHTableViewCell.m
//  Zambon
//
//  Created by sheely on 13-9-6.
//  Copyright (c) 2013年 zywang. All rights reserved.
//

#import "SHTableViewCell.h"

@implementation SHTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    self.selectedBackgroundView = [[UIView alloc]init];
    [self loadSkin];
}

- (void)clear
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
        // Configure the view for the selected state
}

-(void)loadSkin
{
    self.selectedBackgroundView.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorStyleCellSelected"];
    self.backgroundColor = [UIColor clearColor];

}

- (void) alternate :(NSIndexPath*) indexpath
{
    if(indexpath.row % 2 != 0){
        
        self.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorLightBackGround"];
    }else{
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
