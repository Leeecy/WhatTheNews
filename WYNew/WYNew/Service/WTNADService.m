//
//  WTNADService.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/27.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNADService.h"
#import "WTNNewsResultModel.h"
#import "AFHTTPRequestOperationManager.h"
@implementation WTNADService
-(void)getADImageList:(CompleteHandle)handle{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ZHIHU_NEWS_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSMutableArray *resultArr = [NSMutableArray new];
        if (responseObject[@"top_stories"]) {
            NSArray *arr = responseObject[@"top_stories"];
            for (NSDictionary *dic in arr) {
                WTNTopStoryModel *model = [[WTNTopStoryModel alloc]initWithDictionary:dic error:nil];
                if (dic[@"image"]) {
                    [resultArr addObject:model.image];
                }
            }
        }
        handle(resultArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)getADLabelList:(CompleteHandle)handle{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ZHIHU_NEWS_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *resultArr = [NSMutableArray new];
        if (responseObject[@"top_stories"]) {
            NSArray *arr = responseObject[@"top_stories"];
            for (NSDictionary *dic in arr) {
                WTNTopStoryModel *model = [[WTNTopStoryModel alloc]initWithDictionary:dic error:nil];
                if (dic[@"title"]) {
                    [resultArr addObject:model.title];
                }
            }
        }
        handle(resultArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)getADdetail:(CompleteHandle)handle{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ZHIHU_NEWS_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *resultArr = [NSMutableArray new];
        if (responseObject[@"top_stories"]) {
            NSArray *arr = responseObject[@"top_stories"];
            for (NSDictionary *dic in arr) {
                WTNTopStoryModel *model = [[WTNTopStoryModel alloc]initWithDictionary:dic error:nil];
                if (dic[@"id"]) {
                    [resultArr addObject:model.topStoryId];
                }
            }
        }
        handle(resultArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}
@end





