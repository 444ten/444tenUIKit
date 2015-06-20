//
//  UINib+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/20/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "UINib+TENExtensions.h"

@implementation UINib (TENExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundleOrNil {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:bundleOrNil];
}

#pragma mark -
#pragma mark Public

- (id)instantiateWithClass:(Class)cls {
        return [self instantiateWithClass:cls owner:nil options:nil];
}

- (id)instantiateWithClass:(Class)cls owner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil {
    NSArray *instances = [self instantiateWithOwner:ownerOrNil options:optionsOrNil];
    for (id instance in instances) {
        if (cls == [instance class]) {
            return instance;
        }
    }
    
    return nil;
}

@end
