//
//  TENAppDelegate.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENAppDelegate.h"

#import "UIWindow+TENExtensions.h"

#import "TENSquareModel.h"
#import "TENSquareViewController.h"

#import "TENUsers.h"
#import "TENUsersViewController.h"

@interface TENAppDelegate ()

@end

@implementation TENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

//    TENSquareViewController *controller = [TENSquareViewController new];
//    controller.square = [TENSquareModel new];
    
    TENUsersViewController *controller = [TENUsersViewController new];
    
    controller.users = [TENUsers sharedUsers];


    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[TENUsers sharedUsers] saveUsers];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[TENUsers sharedUsers] saveUsers];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[TENUsers sharedUsers] saveUsers];
}

@end
