//
//  WYRightMenuViewController.m
//  WYNew
//
//  Created by qianfeng on 16/1/24.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYRightMenuViewController.h"

@interface WYRightMenuViewController ()

@end

@implementation WYRightMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self didShow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didShow{
    // 3d动画旋转 self.iconView.layer.transform
    // 让头像旋转  0, 1, 0  x z 轴为0 y为1 以y为轴旋转
//        [UIView animateWithDuration:1.0 animations:^{
//            self.iconView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
//        } completion:^(BOOL finished) {
//            self.iconView.image = [UIImage imageNamed:@"user_defaultgift"];
//    
//            [UIView animateWithDuration:1.0 animations:^{
//                self.iconView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
//            }];
//        }];
    //    CATransition
    //    CATransition *anim = [CATransition animation];
    //    anim.duration = 1.0;
    //    anim.type = @"rippleEffect";
    //    [self.iconView.layer addAnimation:anim forKey:nil];
//转场动画
//    UIViewAnimationOptionTransitionFlipFromLeft 从左边旋转
    [UIView transitionWithView:self.iconView duration:1.0 options:(UIViewAnimationOptionTransitionFlipFromLeft) animations:^{
        self.iconView.image = [UIImage imageNamed:@"user_defaultgift"];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView transitionWithView:self.iconView duration:1.0 options:(UIViewAnimationOptionTransitionFlipFromRight) animations:^{
                self.iconView.image = [UIImage imageNamed:@"default_avatar"];
            } completion:nil];
        });
    }];
}
@end







