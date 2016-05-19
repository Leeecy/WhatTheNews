//
//  WTNStoryModel.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNStoryModel.h"

@implementation WTNStoryModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"storyId"}];
}
@end
