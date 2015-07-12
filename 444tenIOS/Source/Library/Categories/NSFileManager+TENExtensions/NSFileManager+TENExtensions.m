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

+ (NSString *)documentsPathWithFileName:(NSString *)fileName {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];

    return [path stringByAppendingPathComponent:fileName];
}

//+ (NSURL *)documentsURLWithFileName:(NSString *)fileName {
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    
//    path = [path stringByAppendingString:fileName];
//    
//    return [NSURL URLWithString:path];
//}

@end
