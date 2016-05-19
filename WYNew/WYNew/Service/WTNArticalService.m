//
//  WTNArticalService.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNArticalService.h"
#import "WTNNewsResultModel.h"
#import "AFHTTPRequestOperationManager.h"
@implementation WTNArticalService
/**
-(void)getArticalList:(CompleteHandle)handle{
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   // manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:ZHIHU_NEWS_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *resultArr = [NSMutableArray new];
        if (responseObject) {
            if (responseObject[@"stories"]) {
                NSArray *arr = responseObject[@"stories"];
                for (NSDictionary *tempDic in arr) {
                    WTNStoryModel *model = [[WTNStoryModel alloc]initWithDictionary:tempDic error:nil];
                    [resultArr addObject:model];
                }
            }
        }
          handle(resultArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
 */
-(void)getArticalListByTime:(NSString*)time Date:(NSString*)date complete:(CompleteHandle)handle{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    NSString * path = [NSString stringWithFormat:@"%@%@%@",ZHIHU_NEWS_MORE,time,date];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *resultArr = [NSMutableArray new];
        if (responseObject) {
            if (responseObject[@"stories"]) {
                NSArray *arr = responseObject[@"stories"];
                for (NSDictionary *tempDic in arr) {
                    WTNStoryModel *model = [[WTNStoryModel alloc]initWithDictionary:tempDic error:nil];
                    [resultArr addObject:model];
                }
            }
        }
        handle(resultArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}

@end








