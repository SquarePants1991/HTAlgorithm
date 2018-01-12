//
//  HTLRULinkedList.m
//  Expecta
//
//  Created by ocean on 2018/1/11.
//

#import "HTLRULinkedList.h"

@implementation HTLRULinkedListPair
+ (HTLRULinkedListPair *)makePair:(id <HTLRUKey>)key value:(id)value {
    HTLRULinkedListPair *pair = [HTLRULinkedListPair new];
    pair.key = key;
    pair.value = value;
    return pair;
}
@end

@implementation HTLRULinkedList

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    if (self = [super init]) {
        _capacity = capacity;
    }
    return self;
}

- (NSArray * _Nullable)add:(id)value withKey:(id <HTLRUKey>)key {
    HTLRULinkedListPair *pair = [HTLRULinkedListPair makePair:key value:value];
    NSUInteger size = [self size];
    NSMutableArray *removedValues = nil;
    
    if (size >= self.capacity) {
        HTLinkedListNode *willBeRemovedNode = [self nodeAt:size - 1];
        self.tail = willBeRemovedNode.prev;
        if (self.tail) {
            self.tail.next = nil;
        }
        if (willBeRemovedNode == self.head) {
            self.head = nil;
        }
        
        removedValues = [NSMutableArray new];
        while (willBeRemovedNode) {
            HTLRULinkedListPair *pair = willBeRemovedNode.value;
            [removedValues addObject: pair.value];
            willBeRemovedNode = willBeRemovedNode.next;
        }
    }
    [self insert:pair before:0];
    return [removedValues copy];
}

- (__nullable id)fetch:(id <HTLRUKey>)key {
    HTLinkedListNode *node = self.head;
    HTLRULinkedListPair *foundPair = nil;
    while (node != nil) {
        HTLRULinkedListPair *pair = (HTLRULinkedListPair *)node.value;
        if ([pair.key isEqualToLRUKey:key]) {
            foundPair = pair;
            break;
        }
        node = node.next;
    }
    if (node) {
        [self removeNode:node];
        [self insertNode:node before:0];
    }
    return foundPair.value;
}
@end
