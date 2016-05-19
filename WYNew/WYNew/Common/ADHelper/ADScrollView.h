//
//  ADScrollView.h
//  zhangchu掌厨
//
//  Created by qianfeng on 15/12/10.
//  Copyright (c) 2015年 cl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADScrollView : UIScrollView
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic, strong)NSString * imageUrl;
@property(nonatomic, strong)NSArray * imageUrlArr;
@property(nonatomic, strong)NSArray * labelArr;
-(void)reloadData;//刷新数据 从中间一张开始
@end
