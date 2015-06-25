//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

static NSString * const kTENImageName = @"cat.jpg";

@implementation TENUser

@dynamic userImage;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    static NSUInteger userNumber = 0;

    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"User_%lu", userNumber];
        
        userNumber += 1;
    }
    
    return self;
}
#pragma mark -
#pragma mark Accessors

- (UIImage *)userImage {
    return [UIImage imageNamed:kTENImageName];
}

@end
