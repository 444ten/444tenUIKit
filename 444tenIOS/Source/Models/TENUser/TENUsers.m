//
//  TENUsers.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsers.h"

#import "NSFileManager+TENExtensions.h"

#import "TENMacro.h"

static NSString * const kTENUsersFileName   = @"kTENUsersFileName.plist";

@interface TENUsers ()

@end

@implementation TENUsers

#pragma mark -
#pragma mark Public

- (void)save {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.objects];
    NSString *file = [NSFileManager documentDirectoryPathWithFileName:kTENUsersFileName];
    
    [data writeToFile:file atomically:YES];
}

#pragma mark -
#pragma mark Overloading

- (void)performLoadingInBackground {
    TENSleep(1);
    self.shouldNotify = NO;

    while (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
    
    NSString *file = [NSFileManager documentDirectoryPathWithFileName:kTENUsersFileName];
    NSData *userData = [NSData dataWithContentsOfFile:file];
    
    if (userData) {
        NSArray *array = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:userData]];
        
        for (id object in array) {
            [self addObject:object];
        }
        
    }
    
    self.shouldNotify = YES;
    self.state = TENModelLoaded;
}

@end
