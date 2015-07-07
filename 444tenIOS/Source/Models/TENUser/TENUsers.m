//
//  TENUsers.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsers.h"

#import "NSFileManager+TENExtensions.h"

static NSString * const kTENUsersFileName   = @"kTENUsersFileName.plist";
static const NSUInteger TENSleepInterval    = 1;

@interface TENUsers ()

@end

@implementation TENUsers

#pragma mark -
#pragma mark Public

- (void)save {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.array];
    NSString *file = [NSFileManager documentDirectoryPathWithFileName:kTENUsersFileName];
    
    [data writeToFile:file atomically:YES];
}

#pragma mark -
#pragma mark Overloading

- (void)performLoadingInBackground {
    sleep(TENSleepInterval);
    
    NSString *file = [NSFileManager documentDirectoryPathWithFileName:kTENUsersFileName];
    NSData *userData = [NSData dataWithContentsOfFile:file];
    
    self.array  = userData
                ? [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:userData]]
                :[NSMutableArray array];
    
    self.state = TENModelLoaded;
}

@end
