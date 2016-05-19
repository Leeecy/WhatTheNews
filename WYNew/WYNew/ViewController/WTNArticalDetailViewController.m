//
//  WTNArticalDetailViewController.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/27.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNArticalDetailViewController.h"
#import "WTNStoryModel.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"
@interface WTNArticalDetailViewController ()<WKNavigationDelegate>{
    WKWebView *_webView;
}

@end

@implementation WTNArticalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configUI{
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"http://daily.zhihu.com/story/%@",self.storyModel.storyId]];
        NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
        [NSURLConnection sendAsynchronousRequest:request1 queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError *  connectionError) {
            NSString * htmlString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            // 深拷贝
            NSMutableString * string = [htmlString mutableCopy];
            //删掉网页不需要的文字 button
            NSRange range = [string rangeOfString:@"class=\"bottom-recommend-download-link\" href=\"/download\""];
            NSRange range1 = [string rangeOfString:@"class=\"bottom-recommend-download-link\""];
            NSRange range2 = [string rangeOfString:@"href=\"/download\""];
            // 删除头部文字 图片
            NSRange range3 = [string rangeOfString:@"class=\"header-for-mobile-btn\""];
            NSRange range4 = [string rangeOfString:@"class=\"header-for-mobile-logo-img\""];
            NSRange range5 = [string rangeOfString:@"class=\"header-for-mobile-meta\""];
            NSRange range6 = [string rangeOfString:@"class=\"button\" data-device=\"ios\""];
            NSRange range7 = [string rangeOfString:@"href=\"/download/android\" class=\"button\" data-device=\"android-local\""];
            [string replaceCharactersInRange:range withString:@""];
            [string replaceCharactersInRange:range1 withString:@""];
            [string replaceCharactersInRange:range2 withString:@""];
            [string replaceCharactersInRange:range3 withString:@""];
            [string replaceCharactersInRange:range4 withString:@""];
            [string replaceCharactersInRange:range5 withString:@""];
            [string replaceCharactersInRange:range6 withString:@""];
            [string replaceCharactersInRange:range7 withString:@""];
            [_webView loadHTMLString:string baseURL:url1];
        }];
    
       // [_webView loadRequest:request1];
        _webView.navigationDelegate = self;
        [self.view addSubview:_webView];
}
// 页面开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
     //打开HUD
   MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //显示的文字
    hud.labelText = @"正在加载...";
}
// 页面加载完成之后调用
//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    //关闭HUD
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//}
// 当内容开始返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    //关闭HUD
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
//隐藏HUD窗口后调用
-(void)hudWasHidden:(MBProgressHUD *)hud{
    [hud removeFromSuperview];
    hud = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
