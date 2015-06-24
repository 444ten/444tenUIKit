//
//  NSMutableArraySpec.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/24/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "Kiwi.h"
#import "NSMutableArray+TENExtensions.h"

SPEC_BEGIN(NSMutableArraySpec)

describe(@"NSMutableArray+TENExtensions", ^{
    __block NSMutableArray *array = nil;
    
    context(@"after object at index 0 move to index 2", ^{
        beforeAll(^{
            array = @[@(0), @(1), @(2), @(3), @(4)].mutableCopy;
            [array moveObjectAtIndex:0 toIndex:2];
        });
        
        it(@"should be of count 5", ^{
            [[array should] haveCountOf:5];
        });
        
        it(@"should contain @(0) at index 2", ^{
            [[array[2] should] equal:@(0)];
        });
        
        it(@"should contain @(2) at index 1", ^{
            [[array[1] should] equal:@(2)];
        });
        it(@"should contain @(3) at index 3", ^{
            
            [[array[3] should] equal:@(3)];
        });
    });

    context(@"after object at index 3 move to index 1", ^{
        beforeAll(^{
            array = @[@(0), @(1), @(2), @(3), @(4)].mutableCopy;
            [array moveObjectAtIndex:3 toIndex:1];
        });
        
        it(@"should be of count 5", ^{
            [[array should] haveCountOf:5];
        });

        it(@"should contain @(3) at index 1", ^{
            [[array[1] should] equal:@(3)];
        });

        it(@"should contain @(0) at index 0", ^{
            [[array[0] should] equal:@(0)];
        });

        it(@"should contain @(2) at index 3", ^{
            [[array[3] should] equal:@(2)];
        });
    });

    context(@"after object at index 4 move to index 0", ^{
        beforeAll(^{
            array = @[@(0), @(1), @(2), @(3), @(4)].mutableCopy;
            [array moveObjectAtIndex:4 toIndex:0];
        });
        
        it(@"should be of count 5", ^{
            [[array should] haveCountOf:5];
        });
        
        it(@"should contain @(4) at index 0", ^{
            [[array[0] should] equal:@(4)];
        });
        
        it(@"should contain @(3) at index 4", ^{
            [[array[4] should] equal:@(3)];
        });
    });

    context(@"after object at index 0 move to index 4", ^{
        beforeAll(^{
            array = @[@(0), @(1), @(2), @(3), @(4)].mutableCopy;
            [array moveObjectAtIndex:0 toIndex:4];
        });
        
        it(@"should be of count 5", ^{
            [[array should] haveCountOf:5];
        });
        
        it(@"should contain @(0) at index 4", ^{
            [[array[4] should] equal:@(0)];
        });
        
        it(@"should contain @(2) at index 1", ^{
            [[array[1] should] equal:@(2)];
        });
    });
});

SPEC_END
