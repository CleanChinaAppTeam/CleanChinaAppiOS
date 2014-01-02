//
//  SHWebViewController.h
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 1/1/14.
//  Copyright (c) 2014 sheely.paean.coretest. All rights reserved.
//

#import "SHViewController.h"

@interface SHWebViewController : SHViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,copy) NSString * URL;
@end
