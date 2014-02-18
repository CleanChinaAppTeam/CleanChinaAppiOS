//
//  SHContentViewController.h
//  siemens.bussiness.partner.CRM.tool
//
//  Created by sheely.paean.Nightshade on 10/31/13.
//  Copyright (c) 2013 MobilityChina. All rights reserved.
//

#import "SHViewController.h"

@interface SHContentViewController : SHViewController<SHTaskDelegate>

@property (weak, nonatomic) IBOutlet UITextView *txtContent;
@property (copy,nonatomic) NSString * func;
@property (strong,nonatomic) NSString * content;
@end
