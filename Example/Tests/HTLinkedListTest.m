//
//  HTAlgorithmTests.m
//  HTAlgorithmTests
//
//  Created by squarepants1991 on 01/10/2018.
//  Copyright (c) 2018 squarepants1991. All rights reserved.
//

// https://github.com/Specta/Specta

#import <HTAlgorithm/HTLinkedList.h>

SpecBegin(HTLinkedListSpecs)

describe(@"Linked List Test", ^{
    it(@"can add new node", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(200)];
        expect([linkedList size]).to.equal(2);
    });
    
    it(@"can remove node", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(200)];
        expect([linkedList size]).to.equal(2);
        [linkedList remove:@(200)];
        expect([linkedList size]).to.equal(1);
    });
    
    it(@"can remove node at", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(200)];
        expect([linkedList size]).to.equal(2);
        [linkedList removeAt:0];
        expect([[linkedList at:0] intValue]).to.equal(200);
    });
    
    it(@"can remove first", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(200)];
        expect([linkedList size]).to.equal(2);
        [linkedList removeFirst];
        expect([[linkedList at:0] intValue]).to.equal(200);
    });
    
    it(@"can remove last", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(200)];
        expect([linkedList size]).to.equal(2);
        [linkedList removeLast];
        expect([[linkedList at:0] intValue]).to.equal(100);
    });
    
    it(@"can insert before", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList insert:@(200) before:0];
        expect([linkedList size]).to.equal(1);
        expect([[linkedList at:0] intValue]).to.equal(200);
        [linkedList insert:@(400) before:0];
        expect([linkedList size]).to.equal(2);
        expect([[linkedList at:0] intValue]).to.equal(400);
        expect([[linkedList at:1] intValue]).to.equal(200);
    });
    
    it(@"can insert after", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(300)];
        [linkedList insert:@(200) after:0];
        expect([linkedList size]).to.equal(3);
        expect([[linkedList at:1] intValue]).to.equal(200);
        [linkedList insert:@(400) after:2];
        expect([[linkedList at:3] intValue]).to.equal(400);
    });
    
    
    it(@"can index node", ^{
        HTLinkedList *linkedList = [HTLinkedList new];
        [linkedList append:@(100)];
        [linkedList append:@(200)];
        expect([[linkedList at:1] intValue]).to.equal(200);
    });
});

SpecEnd


