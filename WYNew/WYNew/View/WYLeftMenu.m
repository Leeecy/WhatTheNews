//
//  WYLeftMenu.m
//  WYNew
//
//  Created by qianfeng on 16/1/20.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYLeftMenu.h"

@interface WYLeftMenu()
@property(nonatomic,weak)UIButton *selectButton;
@end
@implementation WYLeftMenu
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat alpha = 0.2;
        
        [self setupBtnWithIcon:@"sidebar_nav_news" title:@"新闻" bgColor:WYColorRGBA(202, 68, 73, alpha)];
        [self setupBtnWithIcon:@"sidebar_nav_reading" title:@"订阅" bgColor:WYColorRGBA(190, 111, 69, alpha)];
        [self setupBtnWithIcon:@"sidebar_nav_photo" title:@"图片" bgColor:WYColorRGBA(76, 132, 190, alpha)];
        [self setupBtnWithIcon:@"sidebar_nav_video" title:@"视频" bgColor:WYColorRGBA(101, 170, 78, alpha)];
        [self setupBtnWithIcon:@"sidebar_nav_comment" title:@"跟帖" bgColor:WYColorRGBA(170, 172, 73, alpha)];
        [self setupBtnWithIcon:@"sidebar_nav_radio" title:@"电台" bgColor:WYColorRGBA(190, 62, 119, alpha)];
        [self setupBtnWithIcon:@"sidebar_nav_set" title:@"个人" bgColor:WYCOLOR(100, 50, 70)];
    }
    return self;
}
-(void)setDelegate:(id<WYLeftMenuDelegate>)delegate{
    _delegate =delegate;
    // 默认选中新闻按钮
    [self buttonClick:[self.subviews firstObject]];
    //    [self buttonClick:self.subviews[1]];
}
/**
 *  添加按钮
 *
 *  @param icon  图标
 *  @param title 标题
 */
- (UIButton *)setupBtnWithIcon:(NSString *)icon title:(NSString *)title bgColor:(UIColor *)bgColor
{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = self.subviews.count;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    
    // 设置图片和文字
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    // 设置按钮选中的背景  UIImage为封装的类方法

    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:(UIControlStateSelected)];
    
    // 设置高亮的时候不要让图标变色
    btn.adjustsImageWhenHighlighted = NO;
    
    // 设置按钮的内容左对齐  不要设置文字对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//    设置内容往右移
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
  
    return btn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮的frame
    NSInteger btnCount = self.subviews.count;
    CGFloat btnW = self.width;
    //按钮的高度
    CGFloat btnH = self.height / btnCount;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.subviews[i];
        
        btn.width = btnW;
        btn.height = btnH;
        btn.y = i * btnH;
    }
}

#pragma mark - 私有方法
/**
 *  监听按钮点击
 */
- (void)buttonClick:(UIButton *)button
{
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(leftMenu: didSelectedButtonFromIndex:toIndex:)]) {
       // [self.delegate leftMenu:self didSelectedButtonFromIndex:self.selectButton.tag toIndex:button.tag];
        [self.delegate leftMenu:self didSelectedButtonFromIndex:self.selectButton.tag toIndex:button.tag];
    }
    // 1.控制按钮的状态
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
}
-(IBAction)leftMenu:(id)sender{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//给button 设置点击 颜色  封装为类
//-(UIImage*)imageWithColor:(UIColor*)color{
//    CGFloat imageW = 100;
//    CGFloat imageH = 100;
//    //开启基于位图的图形上下文
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100), YES, 0.0);
//    // 2 画一个color颜色的矩形框
//    [color set];
//    UIRectFill(CGRectMake(0, 0, imageW , imageH));
//    // 3 拿到图片
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    // 4 关闭上下文
//    UIGraphicsEndImageContext();
//    return image;
//}
@end








