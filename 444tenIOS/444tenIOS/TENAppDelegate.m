//
//  TENAppDelegate.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENAppDelegate.h"

#import "TENSquareModel.h"
#import "TENSquareViewController.h"

#import "TENUsers.h"
#import "TENUsersViewController.h"

@interface TENAppDelegate ()

@end

@implementation TENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;

//    TENSquareViewController *controller = [TENSquareViewController new];
//    controller.square = [TENSquareModel new];
    
    TENUsersViewController *controller = [TENUsersViewController new];
    TENUsers *users = [TENUsers new];

    window.rootViewController = controller;
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
