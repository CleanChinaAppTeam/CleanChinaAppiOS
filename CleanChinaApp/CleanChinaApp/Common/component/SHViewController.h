//
//  SHViewController.h
//  Core
//
//  Created by zywang on 13-9-3.
//  Copyright (c) 2013年 zywang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHSkin.h"
@interface SHViewController : UIViewController<ISHSkin>
{
    CGRect mRectkeybordview;
}
@property (nonatomic,strong) UIView * keybordView;
@property (nonatomic,assign) int keybordheight;
@property (nonatomic,assign) BOOL showBackItem;

- (void)showWaitDialog:(NSString*)title state:(NSString*)state;

- (void)dismissWaitDialog;

- (void)dismissWaitDialog:(NSString*)msg;

- (void)dismissWaitDialogSuccess;

- (void)showWaitDialogForNetWork;

- (void)showWaitDialogForNetWorkDismissBySelf;

- (void)alertViewCancelOnClick;

- (void)alertViewEnSureOnClick;

- (void)showAlertDialog:(NSString*)content;

- (void)showAlertDialogForCancel:(NSString*)content;

- (void)showAlertDialog:(NSString*)content otherButton:(NSString*)button;

- (void)showAlertDialog:(NSString*)content button:(NSString*)button otherButton:(NSString*)otherbutton;

- (void)showAlertDialog:(NSString*)content button:(NSString*)button otherButton:(NSString*)otherbutton tag:(int)tag;

- (void)dismiss;
@end
