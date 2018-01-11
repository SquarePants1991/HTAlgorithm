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

- (void)add:(id)value withKey:(id <HTLRUKey>)key {
    HTLRULinkedListPair *pair = [HTLRULinkedListPair makePair:key value:value];
    NSUInteger size = [self size];
    if (size >= self.capacity) {
        HTLinkedListNode *willBeRemovedNode = [self nodeAt:size - 1];
        self.tail = willBeRemovedNode.prev;
        if (self.tail) {
            self.tail.next = nil;
        }
        if (willBeRemovedNode == self.head) {
            self.head = nil;
        }
    }
    [self insert:pair before:0];
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
    [self removeNode:node];
    [self insertNode:node before:0];
    return foundPair.value;
}
@end
