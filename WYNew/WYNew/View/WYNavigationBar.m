//
//  WYNavigationBar.m
//  WYNew
//
//  Created by qianfeng on 16/1/24.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYNavigationBar.h"

@implementation WYNavigationBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) continue;
        
        if (button.centerX < self.width * 0.5) { // 左边的按钮
            button.x = 0;
        } else if (button.centerX > self.width * 0.5) { // 右边的按钮
            button.x = self.width - button.width;
        }
    }
}

@end
