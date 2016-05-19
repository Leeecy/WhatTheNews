//
//  UIView+ECButton.h
//  EasyChat
//
//  Created by qianfeng on 16/1/8.
//  Copyright © 2016年 cl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ECButton)
//继承UIView
//直接修改UIView各个属性
@property (nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property (nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGSize size;
//位置
@property (nonatomic,assign)CGPoint origin;
@end
