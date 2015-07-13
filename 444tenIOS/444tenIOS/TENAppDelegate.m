//
//  TENAppDelegate.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENAppDelegate.h"

#import "UIViewController+TENExtensions.h"
#import "UIWindow+TENExtensions.h"

#import "TENSquareModel.h"
#import "TENSquareViewController.h"

#import "TENUsers.h"
#import "TENUsersViewController.h"

#import "TENTestViewController.h"

@interface TENAppDelegate ()
@property (nonatomic, strong)   TENUsers    *users;

@end

@implementation TENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

//    TENSquareViewController *controller = [TENSquareViewController controller];
//    controller.square = [TENSquareModel new];
    
//    TENTestViewController *controller = [TENTestViewController controller];

    TENUsersViewController *controller = [TENUsersViewController controller];

    TENUsers *users = [TENUsers new];
    self.users = users;
    controller.users = users;
    
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.users save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.users save];
}

@end
