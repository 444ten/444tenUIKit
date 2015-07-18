//
//  NSURLSession+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "NSURLSession+TENExtensions.h"

@implementation NSURLSession (TENExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSURLSession *)sharedEphemeralSessionForClass:(Class)cls {
    static NSMapTable *__sessionTable = nil;
    static NSLock *__lock = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sessionTable = [NSMapTable strongToStrongObjectsMapTable];
        __lock = [NSLock new];
    });
    
    [__lock lock];

    NSURLSession *result = [__sessionTable objectForKey:cls];
    
    if (!result) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        result = [NSURLSession sessionWithConfiguration:configuration];
        
        [__sessionTable setObject:result forKey:cls];
    }

    [__lock unlock];
    
    return result;
}

@end
