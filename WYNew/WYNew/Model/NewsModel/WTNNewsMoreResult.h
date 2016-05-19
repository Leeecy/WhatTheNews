//
//  WTNNewsMoreResult.h
//  WhatTheNews
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "WTNStoryMoreModel.h"
@interface WTNNewsMoreResult : JSONModel
@property (nonatomic, copy) NSString *date;
@property (nonatomic, strong)NSArray<WTNStoryMoreModel> * stories;
@end
