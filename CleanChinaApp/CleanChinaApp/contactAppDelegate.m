//
//  contactAppDelegate.m
//  CleanChinaApp
//
//  Created by sheely.paean.Nightshade on 11/28/13.
//  Copyright (c) 2013 sheely.paean.coretest. All rights reserved.
//

#import "contactAppDelegate.h"
#import "SHMainViewController.h"

@implementation contactAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if (!iOS7) {
        [application setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mMainViewController = [[SHMainViewController alloc]init];
   
//    UINavigationController* mNavigationViewController = [[UINavigationController alloc]initWithRootViewController:mMainViewController];
    UINavigationController* mNavigationViewController = [[UINavigationController alloc]init];
    [mNavigationViewController pushViewController:mMainViewController animated:NO];
    mNavigationViewController.navigationBar.backgroundColor = [NVSkin.instance colorOfStyle:@"ColorNavigationBackGround"];
    if(iOS7){
        mNavigationViewController.navigationBar.barTintColor = [NVSkin.instance colorOfStyle:@"ColorNavigationBackGround"];
        mNavigationViewController.navigationBar.tintColor = [UIColor whiteColor];
    }else{
        mNavigationViewController.navigationBar.tintColor = [NVSkin.instance colorOfStyle:@"ColorNavigationBackGround"];
    }
    mNavigationViewController.navigationBar.translucent = NO;
    [mNavigationViewController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    [mNavigationViewController.navigationBar setHidden:YES];
//    [self.view addSubview:mNavigationViewController.view];
    
      self.window.rootViewController = mNavigationViewController;
    //mNavigationViewController.view.frame = [[UIScreen mainScreen] bounds];
    [self.window makeKeyAndVisible];
    //self.w
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
