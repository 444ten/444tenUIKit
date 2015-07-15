//
//  NSFileManager+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/6/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "NSFileManager+TENExtensions.h"

@implementation NSFileManager (TENExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)documentsPath {
    return [self directoryPathWithType:NSDocumentDirectory];
}

+ (NSString *)documentsPathWithFileName:(NSString *)fileName {
    return [self filePathWithDirectoryType:NSDocumentDirectory fileName:fileName];;
}

+ (NSString *)directoryPathWithType:(NSSearchPathDirectory)type {
    return [self filePathWithDirectoryType:type fileName:nil];
}

+ (NSString *)filePathWithDirectoryType:(NSSearchPathDirectory)type
                               fileName:(NSString *)fileName
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(type, NSUserDomainMask, YES) firstObject];

    return [path stringByAppendingPathComponent:fileName];
}

@end
