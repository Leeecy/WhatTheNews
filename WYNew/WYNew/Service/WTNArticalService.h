//
//  WTNArticalService.h
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CompleteHandle)(id data);
@interface WTNArticalService : NSObject
//-(void)getArticalList:(CompleteHandle)handle;
-(void)getArticalListByTime:(NSString*)time Date:(NSString*)date complete:(CompleteHandle)handle;
@end
