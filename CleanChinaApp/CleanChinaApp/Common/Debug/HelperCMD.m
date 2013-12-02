//
//  HelperCMD.m
//  Aroundme
//
//  Created by W Sheely on 13-2-20.
//  Copyright (c) 2013年 dianping.com. All rights reserved.
//

#import "HelperCMD.h"

@implementation HelperCMD
- (void)execute{
    NSMutableString * cmd = [NSMutableString stringWithFormat:@"%@", @"command list \n"];
    [cmd appendFormat:@"help: 帮助\n"];
    [cmd appendFormat:@"cls : 清空屏幕\n"];
    [cmd appendFormat:@"ip\\ipconfig: 设置host地址\n"];
    [cmd appendFormat:@"ipconfig: 设置host地址\n"];
    [cmd appendFormat:@"log : 读取log\n"];
    [cmd appendFormat:@"l   : 读取log\n"];
    [NVDebugPanelController.instance addLog:cmd];
}
@end

@implementation help


@end