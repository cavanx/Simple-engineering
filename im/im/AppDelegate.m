//
//  AppDelegate.m
//  im
//
//o  Created by 历成栋 on 2017/2/18.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "AppDelegate.h"
#import "Main/CavanTbaController.h"
#import "Controller/LoginVc/LoginController.h"
#import <HyphenateFullSDK/EMSDK.h>
#import "CavanTbaController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[LoginController alloc]init];
    [self.window makeKeyAndVisible];
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"708840354#im"];
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    if ([EMClient sharedClient].isAutoLogin) {
        self.window.rootViewController = [[CavanTbaController alloc]init];
    }
    
    return YES;
}
- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
    if (aConnectionState == EMConnectionConnected) {
        NSLog(@"网络连接成功");
    }else{
        NSLog(@"网络连接失败");
    }
}
- (void)didLoginFromOtherDevice{
    NSLog(@"你的账号在其他设备上登录");
}
- (void)didAutoLoginWithError:(EMError *)aError{
    if (!aError) {
        NSLog(@"自动登录成功-");
    }else{
        NSLog(@"自动登录失败-");
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[EMClient sharedClient] applicationWillEnterForeground:application];

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
