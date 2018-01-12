//
//  HTAlgorithmTests.m
//  HTAlgorithmTests
//
//  Created by squarepants1991 on 01/10/2018.
//  Copyright (c) 2018 squarepants1991. All rights reserved.
//

// https://github.com/Specta/Specta

#import <HTAlgorithm/HTLRULinkedList.h>

@interface NSString (LRU) <HTLRUKey>
@end

@implementation NSString (LRU)
- (BOOL)isEqualToLRUKey:(id <HTLRUKey>)key {
    return [self isEqualToString:(NSString *) key];
}
@end

SpecBegin(HTLRULinkedListSpecs)
describe(@"LRULinked List Test", ^{
    it(@"can add new value", ^{
        HTLRULinkedList *linkedList = [[HTLRULinkedList alloc] initWithCapacity:3];
        [linkedList add:@(100) withKey:@"key-1"];
        [linkedList add:@(200) withKey:@"key-2"];
        expect([linkedList size]).to.equal(2);
    });
    
    it(@"can remove old value", ^{
        HTLRULinkedList *linkedList = [[HTLRULinkedList alloc] initWithCapacity:3];
        [linkedList add:@(100) withKey:@"key-1"];
        [linkedList add:@(200) withKey:@"key-2"];
        [linkedList add:@(300) withKey:@"key-3"];
        expect([linkedList size]).to.equal(3);
        NSArray *removedVals = [linkedList add:@(400) withKey:@"key-4"];
        expect([removedVals count]).to.equal(1);
        expect([removedVals[0] intValue]).to.equal(100);
        expect([linkedList size]).to.equal(3);
        expect([[(HTLRULinkedListPair *)[linkedList at:0] value] intValue]).to.equal(400);
        expect([[(HTLRULinkedListPair *)[linkedList at:1] value] intValue]).to.equal(300);
        expect([[(HTLRULinkedListPair *)[linkedList at:2] value] intValue]).to.equal(200);
    });
    
    it(@"can fetch and update value position", ^{
        HTLRULinkedList *linkedList = [[HTLRULinkedList alloc] initWithCapacity:3];
        [linkedList add:@(100) withKey:@"key-1"];
        [linkedList add:@(200) withKey:@"key-2"];
        [linkedList add:@(300) withKey:@"key-3"];
        
        expect([[linkedList fetch:@"key-1"] intValue]).to.equal(100);
        expect([[(HTLRULinkedListPair *)[linkedList at:0] value] intValue]).to.equal(100);
        
        [linkedList add:@(400) withKey:@"key-4"];
        expect([linkedList size]).to.equal(3);
        expect([[(HTLRULinkedListPair *)[linkedList at:0] value] intValue]).to.equal(400);
        expect([[(HTLRULinkedListPair *)[linkedList at:1] value] intValue]).to.equal(100);
        expect([[(HTLRULinkedListPair *)[linkedList at:2] value] intValue]).to.equal(300);
    });
    
});
SpecEnd


