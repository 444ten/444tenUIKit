//
//  NSURLSession+TENExtensions.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (TENExtensions)

+ (NSURLSession *)sharedEphemeralSessionForClass:(Class)cls;

@end
