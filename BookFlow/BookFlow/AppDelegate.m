//
//  AppDelegate.m
//  BookFlow
//
//  Created by chenlong on 2017/5/26.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CLNavigationController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //test
    
    CLNavigationController *navigationVC;
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    if ([self isLogined]) {
        //已经登录，跳到主页
        MainViewController *mainVC = [[MainViewController alloc] init];
        navigationVC = [[CLNavigationController alloc]initWithRootViewController:mainVC];
        self.window.rootViewController = navigationVC;
    } else {
        //还未登录，跳到登录页面
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        self.window.rootViewController = loginVC;
    }
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Info

- (BOOL)isLogined {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogined = [userDefaults boolForKey:@"isLogined"];
    return isLogined;
}

- (void)setIsLogined:(BOOL)isLogined {
    [[NSUserDefaults standardUserDefaults] setBool:isLogined forKey:@"isLogined"];
}


@end
