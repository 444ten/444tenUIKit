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

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls bundle:nil owner:nil options:nil];
}

+ (id)objectWithClass:(Class)cls
               bundle:(NSBundle *)bundle
                owner:(id)owner
              options:(NSDictionary *)options
{
    UINib *nib = [self nibWithClass:cls bundle:bundle];
    
    return [nib instantiateWithClass:cls owner:owner options:options];
}

#pragma mark -
#pragma mark Public

- (id)instantiateWithClass:(Class)cls {
        return [self instantiateWithClass:cls owner:nil options:nil];
}

- (id)instantiateWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *instances = [self instantiateWithOwner:owner options:options];
    for (id instance in instances) {
        if (cls == [instance class]) {
            return instance;
        }
    }
    
    return nil;
}

@end
