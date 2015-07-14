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

+ (NSURLSession *)sharedDefaultSession {
    static NSURLSession *result = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        result = [NSURLSession sessionWithConfiguration:configuration];
    });
    
    return result;
}

@end
