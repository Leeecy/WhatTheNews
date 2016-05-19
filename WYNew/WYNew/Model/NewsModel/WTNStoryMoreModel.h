//
//  WTNStoryMoreModel.h
//  WhatTheNews
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol WTNStoryMoreModel
@end
@interface WTNStoryMoreModel : JSONModel
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *ga_prefix;
//图片数组只有一个键值对，不用重写
@property (nonatomic, strong)NSArray <Optional>*images;
@end
