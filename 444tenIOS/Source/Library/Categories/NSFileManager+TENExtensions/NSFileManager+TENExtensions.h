//
//  NSFileManager+TENExtensions.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/6/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (TENExtensions)

+ (NSString *)documentsPath;
+ (NSString *)documentsPathWithFileName:(NSString *)fileName;

+ (NSString *)directoryPathWithType:(NSSearchPathDirectory)type;

+ (NSString *)filePathWithDirectoryType:(NSSearchPathDirectory)type
                               fileName:(NSString *)fileName;

@end
