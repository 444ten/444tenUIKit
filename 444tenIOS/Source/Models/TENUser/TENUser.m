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

static NSString * const kTENURL = @"https://upload.wikimedia.org/wikipedia/commons/2/22/Apple_computer_cat.jpg";

static NSUInteger userNumber = 0;

@interface TENUser ()

@end

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
#pragma mark Overloading

- (void)performLoadingInBackground {
    TENUSleep(1000*1000 + 1000 * arc4random_uniform(1000));
    
    self.userImage = [TENImage imageWithURL:[NSURL URLWithString:kTENURL]];
    
    self.state = TENModelLoaded;
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
