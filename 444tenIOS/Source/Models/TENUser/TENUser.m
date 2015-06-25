//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

static NSString * const kTENImageName   = @"cat.jpg";
static NSString * const kCoderName      = @"kCoderName";

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

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:kCoderName];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:kCoderName];
}

@end
