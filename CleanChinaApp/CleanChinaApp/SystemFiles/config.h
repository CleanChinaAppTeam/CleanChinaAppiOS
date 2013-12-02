//
//  config.h
//  Zambon
//
//  Created by sheely on 13-9-23.
//  Copyright (c) 2013年 zywang. All rights reserved.
//

#import "Core.h"
#import "common.h"
//#define URL_HEADER @ "http://192.168.1.206:8091"
#define URL_HEADER @ "http://202.91.228.152:8091"
#define URL_BATA @ "http://192.168.11.194"
#define URL_DEVELOPER @ "http://202.91.228.152:8091"

#define URL_FOR(a) [NSString stringWithFormat:@"%@/%@",URL_HEADER,a];

#define DEVICE_TOKEN @"DeviceTokenStringKEY"


#define RECT_RIGHTSHOW CGRectMake(87, 23, 930, 730)
#define RECT_RIGHTNAVIGATION CGRectMake(0, 0, 930, 44)
#define RECT_RIGHTLIST CGRectMake(0, 44, 240, 678)
#define RECT_RIGHTCONTENT CGRectMake(240, 0, 685  , 730)
#define RECT_RIGHTCONTENT2 CGRectMake(667, 23, 350  , 730)
#define CELL_GENERAL_HEIGHT 90
#define CELL_GENERAL_HEIGHT2 70
#define CELL_GENERAL_HEIGHT3 44
#define CELL_SECTION_HEADER_GENERAL_HEIGHT 38
#define RECT_MAIN_LANDSCAPE_RIGHT CGRectMake(-20, 0, 768, 1004)
#define RECT_MAIN_LANDSCAPE_LEFT CGRectMake(20, 0, 768, 1004)

//notification
#define NOTIFICATION_LOGIN_SUCCESSFUL @"notification_login_successful"

#define IS_OTC(a) if((a) case )

#define OTC @"OTC"
#define RX @"RX"
