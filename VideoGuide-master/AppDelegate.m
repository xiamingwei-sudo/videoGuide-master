//
//  AppDelegate.m
//  VideoGuide-master
//
//  Created by Sino on 16/6/14.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import "AppDelegate.h"
#import "NewFeatureViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [NewFeatureViewController setUpNewFuture];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
