//
//  WTNTopStoryModel.h
//  WhatTheNews
//
//  Created by qianfeng on 15/12/26.
//  Copyright © 2015年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@protocol WTNTopStoryModel
@end
@interface WTNTopStoryModel : JSONModel
@property (nonatomic, strong) NSNumber *topStoryId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *ga_prefix;
@end
