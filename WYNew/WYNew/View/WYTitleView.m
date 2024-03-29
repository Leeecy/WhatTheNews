//
//  WYTitleView.m
//  WYNew
//
//  Created by qianfeng on 16/1/23.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYTitleView.h"

@implementation WYTitleView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:(UIControlStateNormal)];
        [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.titleLabel.font = [UIFont systemFontOfSize:22];
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        self.height = self.currentImage.size.height;
    }
    return self;
}
//重写set方法
-(void)setTitle:(NSString *)title{
    _title = [title copy];
    [self setTitle:title forState:UIControlStateNormal];
    //自动适应大小
    NSDictionary *attrs = @{NSFontAttributeName : self.titleLabel.font};
    CGFloat titleW = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    
    self.width = titleW + self.titleEdgeInsets.left + self.currentImage.size.width;

}

@end
