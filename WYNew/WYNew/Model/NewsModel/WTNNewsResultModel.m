//
//  WTNNewsResultModel.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNNewsResultModel.h"

@implementation WTNNewsResultModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"stories":@"storyArr",@"top_stories":@"top_storiesArr"}];
}
@end
