//
//  WYADViewController.m
//  WYNew
//
//  Created by qianfeng on 16/1/24.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYADViewController.h"
#import "WYMainVC.h"
@interface WYADViewController ()

@end

@implementation WYADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark 初始化UI
-(void)configUI{
    
//首先在storyBoard 设置启动页为广告控制器
    // 1.背景图片
    UIImageView *bg = [[UIImageView alloc] init];
    bg.image = [UIImage imageNamed:@"Default"];
    bg.frame = self.view.bounds;
    [self.view addSubview:bg];
    // 2.广告图片(真实的广告图片应该要先下载广告图片)
    UIImageView *ad = [[UIImageView alloc]init];
    ad.image = [UIImage imageNamed:@"AD"];
    ad.width = 280;
    ad.height = 300;
    ad.centerX = self.view.width * 0.5;
    ad.y = 60;
    [self.view addSubview:ad];
    //3.2s后调到下一个主界面
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //在Main.storyBoard 设置 view controller继承 WYMainVC  storyBoard ID 为 WYMainVC
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        window.rootViewController = [storyBoard instantiateViewControllerWithIdentifier:@"WYMainVC"];
    });
}
#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件

#pragma mark -
#pragma mark 数据请求

#pragma mark -
#pragma mark 代理

#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁
@end
