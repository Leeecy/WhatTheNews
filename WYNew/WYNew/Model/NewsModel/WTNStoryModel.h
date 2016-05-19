//
//  WTNStoryModel.h
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@protocol WTNStoryModel
@end
@interface WTNStoryModel : JSONModel
@property (nonatomic, strong) NSNumber *storyId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *ga_prefix;
//图片数组只有一个键值对，不用重写
@property (nonatomic, strong)NSArray <Optional>*images;
@end
