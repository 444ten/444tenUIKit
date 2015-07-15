//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

#import "TENMacro.h"

static NSString * const kCoderName          = @"kCoderName";

static NSUInteger userNumber = 0;

@implementation TENUser

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {

    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"User_%lu", userNumber];
        
        userNumber += 1;
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:kCoderName];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kCoderName];
}

@end
