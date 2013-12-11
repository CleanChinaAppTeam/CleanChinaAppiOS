//
//  NVDebugPanelController.m
//  Aroundme
//
//  Created by W Sheely on 13-1-5.
//  Copyright (c) 2013年 dianping.com. All rights reserved.
//

#import "NVDebugPanelController.h"
#import "Command.h"
#import "CommandFactory.h"

@implementation NVDebugPanelController

//@synthesize  isShow = mShow;
//@synthesize  isPerspective = _isPerspective;
NVDebugPanelController * mDebugPanel;

+(NVDebugPanelController*) instance{
    if(mDebugPanel == nil){
        mDebugPanel = [[NVDebugPanelController alloc]init];
    }
    return mDebugPanel;
}

//- (void)show
//{
//    if(mShow){
//        return;
//    }
//    mShow = YES;
//    self.isPerspective = YES;
//   }
//- (void)animationDidEnd{
//    [self.view removeFromSuperview];
//}

//- (void)dismiss
//{
//    mShow = NO;
//
//}

- (void)addLog:(NSString *)logStr
{
    //BOOL isScroll =  mTextConsole.contentOffset.y + mTextConsole.frame.size.height == mTextConsole.contentSize.height ? YES:NO;
    mTextConsole.text = [mTextConsole.text stringByAppendingString: [NSString stringWithFormat:@">%@\n",logStr]];
    //CGPoint point = CGPointMake(mTextConsole.contentOffset.x, mTextConsole.contentSize.height - mTextConsole.frame.size.height) ;
    //if(isScroll){
        NSRange range = NSMakeRange ([mTextConsole.text length], 0);
        [mTextConsole scrollRangeToVisible:range];
    //}
}
- (void)viewDidLoad{
    [super viewDidLoad];
    mTextField.returnKeyType = UIReturnKeyDone;
    self.keybordView = self.view;
    self.keybordheight = 320;
    NSString *str = @"   **********************************************************\n                     Sheely -- demo v1.1\n          help to list all commands & description \n             2013 sheely copyright & good luck \n   **********************************************************\n";
    mTextConsole.text = str;
    mTextConsole.editable = NO;
    mTextConsole.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationReceive:) name:CORE_NOTIFICATION_LOG_RECORD object:nil];
}

- (void)notificationReceive:(NSNotification *) info
{
    [self addLog:info.object];
}
- (void)viewDidUnload {
    mTextField = nil;
    mTextConsole = nil;
    [super viewDidUnload];
}
#pragma -mark delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    NSString* str = textField.text;
    [self addLog:str];
    NSArray* array = [str componentsSeparatedByString :@" "];
    Command* cmd;
    if([array count]>0){
        NSString* command = [array objectAtIndex:0];
        if([command caseInsensitiveCompare:@"cls"] == NSOrderedSame){
            mTextConsole.text = @"";
            mTextField.text = @"";
        }else{
            cmd = [CommandFactory factoryByName:command];
            if(cmd){
                if(array.count > 1){
                    NSMutableArray * args = [NSMutableArray arrayWithArray:array];
                    [args removeObjectAtIndex:0];//首部去掉
                    cmd.args = args;
                }
                [cmd execute];
                [self addLog:@"OK, command completion\n"];
                textField.text = @"";
            }else{
                [self addLog:@"Sorry, can't find the command\n"];
            }
        }
    }
 
    return NO;
}
#pragma UITextView delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}
- (void)textViewDidChange:(UITextView *)textView
{
    
}

@end
