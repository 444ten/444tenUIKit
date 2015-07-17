//
//  TENObjectCaсhe.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/17/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TENObjectCache : NSObject

- (NSUInteger)count;

- (id)objectForKey:(id)aKey;

- (void)removeObjectForKey:(id)aKey;
- (void)setObject:(id)anObject forKey:(id)aKey;

- (void)removeAllObjects;

- (NSDictionary *)dictionaryRepresentation;

@end
