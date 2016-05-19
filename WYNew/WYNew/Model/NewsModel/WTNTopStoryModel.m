//
//  WTNTopStoryModel.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/26.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNTopStoryModel.h"

@implementation WTNTopStoryModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"topStoryId"}];
}

@end
