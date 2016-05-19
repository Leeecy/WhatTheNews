//
//  WTNNewsResultModel.h
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "WTNStoryModel.h"
#import "WTNTopStoryModel.h"

@interface WTNNewsResultModel : JSONModel
@property (nonatomic, copy)NSString <Optional>* date;
// 第一层对象为数组 ，需要添加协议  如果第一层为字典，只需要导入头文件 定义属性
@property (nonatomic, strong)NSArray<WTNStoryModel> * storyArr;
@property (nonatomic, strong)NSArray<WTNTopStoryModel> * top_storiesArr;

@end
