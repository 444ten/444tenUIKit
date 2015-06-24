//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

@implementation TENUser

@dynamic userImage;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)user {
    return [[self alloc] initUser];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initUser {
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
    return [UIImage imageNamed:@"cat.jpg"];
}

@end
