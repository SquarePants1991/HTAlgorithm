//
//  HTLRULinkedList.h
//  Expecta
//
//  Created by ocean on 2018/1/11.
//

#import "HTLinkedList.h"

@protocol HTLRUKey
- (BOOL)isEqualToLRUKey:(__nullable id <HTLRUKey>)key;
@end

@interface HTLRULinkedListPair : NSObject
@property (strong, nonatomic) id <HTLRUKey> key;
@property (strong, nonatomic) id value;

+ (HTLRULinkedListPair *)makePair:(id <HTLRUKey>)key value:(id)value;
@end

@interface HTLRULinkedList : HTLinkedList
@property (assign, nonatomic, readonly) NSUInteger capacity;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

/// 向列表头部增加新的value，如果列表已满，那么移除列表尾部的节点
/// @param value 添加的value
/// @param key 使用的键值
- (void)add:(id)value withKey:(id <HTLRUKey>)key;

/// 获取某个键值的对应的value，如果有，就返回，并且将value置于列表头部
/// @param key 使用的键值
/// @return 键值对应的value或者为空
- (__nullable id)fetch:(__nonnull id <HTLRUKey>)key;
@end
