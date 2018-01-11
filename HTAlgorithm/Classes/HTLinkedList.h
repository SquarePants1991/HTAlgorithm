//
//  HTLinkedList.h
//  Pods
//
//  Created by ocean on 2018/1/10.
//

#import <Foundation/Foundation.h>

@interface HTLinkedListNode : NSObject
@property (strong, nonatomic) id value;
@property (strong, nonatomic) HTLinkedListNode *next;
@property (weak, nonatomic) HTLinkedListNode *prev;
@end

@interface HTLinkedList : NSObject
@property (strong, nonatomic) HTLinkedListNode *head;
@property (strong, nonatomic) HTLinkedListNode *tail;

- (void)append:(id)value;
- (void)insert:(id)value before:(NSUInteger)index;
- (void)insert:(id)value after:(NSUInteger)index;
- (void)remove:(id)value;
- (void)removeAt:(NSUInteger)index;
- (void)removeFirst;
- (void)removeLast;
- (id)at:(NSUInteger)index;
- (NSUInteger)size;

// node operations
- (HTLinkedListNode *)findNodeWithValue:(id)value;
- (HTLinkedListNode *)nodeAt:(NSUInteger)index;
- (void)removeNode:(HTLinkedListNode *)node;
- (void)appendNode:(HTLinkedListNode *)node;
- (void)insertNode:(HTLinkedListNode *)node before:(NSUInteger)index;
- (void)insertNode:(HTLinkedListNode *)node after:(NSUInteger)index;
@end
