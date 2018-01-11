//
//  HTLinkedList.m
//  Pods
//
//  Created by ocean on 2018/1/10.
//

#import "HTLinkedList.h"

@implementation HTLinkedListNode
- (instancetype)initWithValue:(id)value {
    if (self = [super init]) {
        self.value = value;
        self.next = nil;
        self.prev = nil;
    }
    return self;
}
@end

@implementation HTLinkedList
- (void)append:(id)value {
    HTLinkedListNode *node = [[HTLinkedListNode alloc] initWithValue:value];
    [self appendNode:node];
}

- (void)insert:(id)value before:(NSUInteger)index {
    HTLinkedListNode *node = [[HTLinkedListNode alloc] initWithValue:value];
    [self insertNode:node before:index];
}

- (void)insert:(id)value after:(NSUInteger)index {
    HTLinkedListNode *node = [[HTLinkedListNode alloc] initWithValue:value];
    [self insertNode:node after:index];
}

- (void)remove:(id)value {
    HTLinkedListNode *node = [self findNodeWithValue:value];
    [self removeNode:node];
}

- (void)removeAt:(NSUInteger)index {
    HTLinkedListNode *node = [self nodeAt:index];
    [self removeNode:node];
}

- (void)removeFirst {
    [self removeNode:self.head];
}

- (void)removeLast {
    [self removeNode:self.tail];
}

- (id)at:(NSUInteger)index {
    HTLinkedListNode *node = [self nodeAt:index];
    return node.value;
}

- (NSUInteger)size {
    HTLinkedListNode *node = self.head;
    NSUInteger size = 0;
    while (node != nil) {
        size++;
        node = node.next;
    }
    return size;
}

#pragma mark - Node Operations

- (HTLinkedListNode *)findNodeWithValue:(id)value {
    // 想要用findNodeWithValue，请自定义T类型的isEqual方法
    HTLinkedListNode *node = self.head;
    while (node != nil) {
        if ([node.value isEqual:value]) {
            return node;
        }
        node = node.next;
    }
    return nil;
}

- (HTLinkedListNode *)nodeAt:(NSUInteger)index {
    HTLinkedListNode *node = self.head;
    while (index--) {
        node = node.next;
    }
    return node;
}

- (void)removeNode:(HTLinkedListNode *)node {
    if (node) {
        HTLinkedListNode *prev = node.prev;
        HTLinkedListNode *next = node.next;
        if (prev) {
            prev.next = next;
        }
        if (next) {
            next.prev = prev;
        }
        if (node == self.head) {
            self.head = next;
        }
        if (node == self.tail) {
            self.tail = prev;
        }
    }
}

- (void)appendNode:(HTLinkedListNode *)node {
    if (self.head == nil) {
        self.head = node;
        self.tail = node;
    } else {
        self.tail.next = node;
        node.prev = self.tail;
        self.tail = node;
    }
}

- (void)insertNode:(HTLinkedListNode *)node before:(NSUInteger)index {
    HTLinkedListNode *insertToNode = [self nodeAt:index];
    if (insertToNode != nil) {
        HTLinkedListNode *insertToPrevNode = insertToNode.prev;
        if (insertToPrevNode) {
            insertToPrevNode.next = node;
            node.prev = insertToPrevNode;
        }
        node.next = insertToNode;
        insertToNode.prev = node;
    }
    if (insertToNode == self.head) {
        self.head = node;
    }
}

- (void)insertNode:(HTLinkedListNode *)node after:(NSUInteger)index {
    HTLinkedListNode *insertToNode = [self nodeAt:index];
    if (insertToNode != nil) {
        HTLinkedListNode *insertToNextNode = insertToNode.next;
        if (insertToNextNode) {
            insertToNextNode.prev = node;
            node.next = insertToNextNode;
        }
        node.prev = insertToNode;
        insertToNode.next = node;
    }
    if (insertToNode == self.tail) {
        self.tail = node;
    }
}
@end

