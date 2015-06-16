//
//  TENAppDelegate.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENAppDelegate.h"

#import "TENSquareViewController.h"
#import "TENSquare.h"

@interface TENAppDelegate ()

@end

@implementation TENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;

    TENSquareViewController *controller = [TENSquareViewController new];
    controller.square = [TENSquare new];
    
    window.rootViewController = controller;
    window.backgroundColor = [UIColor greenColor];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
