//
//  WYNavigationController.m
//  WYNew
//
//  Created by qianfeng on 16/1/23.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYNavigationController.h"
#import "WYNavigationBar.h"
@interface WYNavigationController ()

@end

@implementation WYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 替换为自定义的导航栏 kvc方法 self.navigationBar
    [self setValue:[WYNavigationBar new] forKeyPath:@"navigationBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (void)initialize
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    // 设置导航栏背景
    [appearance setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark - 这个方法也是专门用来布局子控件（当控制器的view尺寸发生改变的时候会调用）
//直接重建导航栏封装
//-(void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    for (UIButton *button in self.navigationBar.subviews) {
//        if (![button isKindOfClass:[UIButton class]]) continue;
//        if (button.centerX < self.navigationBar.width / 2) { // 左边的按钮
//                   button.x = 0;
//        }else if (button.centerX > self.navigationBar.width * 0.5) { // 右边的按钮
//                    button.x = self.view.width - button.width;
//        }
//
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
