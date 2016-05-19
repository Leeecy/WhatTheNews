//
//  WTNADService.h
//  WhatTheNews
//
//  Created by qianfeng on 15/12/27.
//  Copyright © 2015年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CompleteHandle)(id data);
@interface WTNADService : NSObject
-(void)getADImageList:(CompleteHandle)handle;
-(void)getADLabelList:(CompleteHandle)handle;
-(void)getADdetail:(CompleteHandle)handle;
@end
