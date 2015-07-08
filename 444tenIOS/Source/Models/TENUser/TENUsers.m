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
@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

@end

@implementation TENUsers

@dynamic fileName;
@dynamic filePath;
@dynamic fileAvailable;

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
    return kTENUsersFileName;
}

- (NSString *)filePath {
    return [NSFileManager documentDirectoryPathWithFileName:self.fileName];
}

- (BOOL)isFileAvailable {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public

- (void)save {
    [[NSKeyedArchiver archivedDataWithRootObject:self.objects] writeToFile:self.filePath atomically:YES];
}

#pragma mark -
#pragma mark Overloading

- (void)performLoadingInBackground {
    TENSleep(1);
    
    [self performBlockWithoutNotify:^{
        while (self.count > 0) {
            [self removeObjectAtIndex:0];
        }
        
        if (self.fileAvailable) {
            NSData *userData = [NSData dataWithContentsOfFile:self.filePath];
            NSArray *array = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:userData]];
            
            for (id object in array) {
                [self addObject:object];
            }
        }
    }];
    
    self.state = TENModelLoaded;
}

@end
