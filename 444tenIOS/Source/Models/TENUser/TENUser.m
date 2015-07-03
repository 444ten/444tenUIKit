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

@interface TENUser ()
@property (nonatomic, strong) UIImage     *userImage;

@end

@implementation TENUser

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
#pragma mark Public

- (void)loadUserImage {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        self.userImage = [UIImage imageNamed:kTENImageName];
        
        self.state = TENModelLoaded;
    });
}

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    switch (state) {
        case TENModelLoaded:
            return @selector(model:didLoadWithUsersInfo:);
            
        default:
            [super selectorForState:state withObject:object];
    }
    
    return NULL;
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
    [aCoder encodeObject:_name forKey:kCoderName];
}

@end
