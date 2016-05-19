//
//  WYMainVC.m
//  WYNew
//
//  Created by qianfeng on 16/1/20.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYMainVC.h"
#import "WYLeftMenu.h"
#import "WYNavigationController.h"
#import "WYNewsTableViewController.h"
#import "WYReadTableViewController.h"
#import "WYPhotoTableViewController.h"
#import "WYCommentTableViewController.h"
#import "WYVideoTableViewController.h"
#import "WYRadioTableViewController.h"
#import "WYRightMenuViewController.h"
#import "WYProfileTableViewController.h"
#import "WYTitleView.h"
#define WYNavShowAnimDuration 0.25
#define WYCoverTag 1001
@interface WYMainVC ()<WYLeftMenuDelegate>{
    WYNavigationController *showingNavigationController;
    WYRightMenuViewController *_rightMenu;
    WYLeftMenu *_leftMenu;
}

@end

@implementation WYMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    // 1.创建子控制器
    [self setupAllChildVcs];
    [self setupLeftMenu];
    [self setupRightMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark 初始化UI
-(void)configUI{
//  1  先创建子控制器 不然数组为空
    //    1.1 创建子控制器  新闻控制器
     WYNewsTableViewController *news = [WYNewsTableViewController new];
    [self setupChildVc:news title:@"新闻"];
   // news.view.backgroundColor = [UIColor grayColor];
    //    添加news控制器为导航控制器的子视图
   // WYNavigationController *newNavigation = [[WYNavigationController alloc]initWithRootViewController:news];
    // newNav.view.frame = self.view.bounds;
    //添加导航控制器为子控制器
    //  [self.view addSubview:newNavigation.view];
    //将newNavigation导航控制器作为 WYMainVC的子控制器
    // 让newsNav成为self（WYMainVC）的子控制器，能保证：self在，newsNav就在
    // 如果两个控制器互为父子关系，那么它们的view也应该互为父子关系
   // [self addChildViewController:newNavigation];
    
    // 1.2  订阅控制器
    WYReadTableViewController *read = [WYReadTableViewController new];
    [self setupChildVc:read title:@"订阅"];
//    read.view.backgroundColor = [UIColor blueColor];
//    WYNavigationController *readNavigation = [[WYNavigationController alloc]initWithRootViewController:read];
//    [self addChildViewController:readNavigation];
    
    // 1.3.图片控制器
    WYPhotoTableViewController *photo = [[WYPhotoTableViewController alloc] init];
    [self setupChildVc:photo title:@"图片"];
    
    // 1.4.视频控制器
    WYVideoTableViewController *video = [[WYVideoTableViewController alloc] init];
    [self setupChildVc:video title:@"视频"];
    
    // 1.5.跟帖控制器
    WYCommentTableViewController *comment = [[WYCommentTableViewController alloc] init];
    [self setupChildVc:comment title:@"跟帖"];
    
    // 1.6.电台控制器
    WYRadioTableViewController *radio = [[WYRadioTableViewController alloc] init];
    [self setupChildVc:radio title:@"电台"];
    // 1.6.电台控制器
    WYProfileTableViewController *profile = [[WYProfileTableViewController alloc] init];
    [self setupChildVc:profile title:@"个人"];

   }
-(void)setupAllChildVcs{
    
}
/**
 *  添加左菜单
 */
-(void)setupLeftMenu{
    //2.1  添加左菜单  左菜单内容简单 所以不需要单独创建VC控制器
    WYLeftMenu *leftMenu = [[WYLeftMenu alloc]init];
    leftMenu.delegate = self;
    leftMenu.height = 300;
    leftMenu.width = 200;
    leftMenu.y = 60;
    //    [self.view addSubview:leftMenu];
    //将左边栏视图放在第一个视图的下面
    [self.view insertSubview:leftMenu atIndex:1];
    _leftMenu = leftMenu;
}
/**
 *  添加右菜单  右菜单内容过多 创建控制器进行管理
 */
-(void)setupRightMenu{
    _rightMenu= [[WYRightMenuViewController alloc]init];
    _rightMenu.view.x = SCREEN_WIDTH - _rightMenu.view.width;
    [self.view insertSubview:_rightMenu.view atIndex:1];
    [self addChildViewController:_rightMenu];
}
/**
 *  初始化一个控制器
 *
 *  @param vc      需要初始化的控制器
 *  @param title   控制器的标题
 */
-(void)setupChildVc:(UIViewController*)childVc title:(NSString*)title{
    // 1.设置背景色
   // childVc.view.backgroundColor = [UIColor blueColor];
 
    // 2 设置标题
    
    WYTitleView *titleView = [[WYTitleView alloc]init];
    //    titleView.width = 100;
    //    titleView.height = 35;
    titleView.title = title;
    childVc.navigationItem.titleView = titleView;
    //   3 左右的按钮
    childVc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(leftBtnClicked:)];
    childVc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" target:self action:@selector(rightBtnClicked:)];
//    44.包装一个导航控制器
    WYNavigationController *navigation = [[WYNavigationController alloc]initWithRootViewController:childVc];
    // 让newsNav成为self（HMMainViewController）的子控制器，能保证：self在，newsNav就在
    // 如果两个控制器互为父子关系，那么它们的view也应该互为父子关系
      [self addChildViewController:navigation];
}
#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件
-(IBAction)leftBtnClicked:(id)sender{
    _leftMenu.hidden = NO;
    _rightMenu.view.hidden = YES;
    // CGAffineTransformMakeTranslation 每次都是以最初位置的中心点为起始参照
    //    CGAffineTransformTranslate每次都是以传入的transform为起始参照
    [UIView animateWithDuration:WYNavShowAnimDuration animations:^{
        if (CGAffineTransformIsIdentity(showingNavigationController.view.transform)) {
            // 取出正在显示的导航控制器的view
            UIView *showingView = showingNavigationController.view;
            //        缩放比例
            CGFloat navH = SCREEN_HEIGHT - 2* 60;
            CGFloat scale = navH / SCREEN_HEIGHT;
            //        菜单左边的间距
            CGFloat leftMenumargin = SCREEN_WIDTH * (1 - scale) / 2;
            CGFloat topmargin = SCREEN_HEIGHT * (1 - scale) / 2;
            CGFloat translateX = 200 -leftMenumargin;
            CGFloat translateY = topmargin - 60;
            //缩放
            CGAffineTransform form = CGAffineTransformMakeScale(scale, scale);
            //        平移
            CGAffineTransform transform = CGAffineTransformTranslate(form, translateX / scale, -translateY /scale);
            //  CGAffineTransform form = CGAffineTransformMakeTranslation(200, 0);
            //self.navigationController.view.transform = transform;
           showingView.transform = transform;
            //     self.navigationController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
            //                添加一个遮盖
            UIButton *cover = [[UIButton alloc]init];
            [cover addTarget:self action:@selector(coverClciked:) forControlEvents:(UIControlEventTouchUpInside)];
//        给遮盖添加一个Tag值 此处不写 当创建遮盖之后 点击左边返回遮盖不会消失 需要点击两次才返回 第一次是移除遮盖
            cover.tag = WYCoverTag;
            cover.frame = showingView.bounds;
            [showingView addSubview:cover];
        }
        else{
            self.navigationController.view.transform = CGAffineTransformIdentity;
        }
    }];
    
}
-(IBAction)rightBtnClicked:(id)sender{
    _leftMenu.hidden = YES;
    _rightMenu.view.hidden = NO;
    // CGAffineTransformMakeTranslation 每次都是以最初位置的中心点为起始参照
    //    CGAffineTransformTranslate每次都是以传入的transform为起始参照
    [UIView animateWithDuration:WYNavShowAnimDuration animations:^{
            // 取出正在显示的导航控制器的view
            UIView *showingView = showingNavigationController.view;
            //        缩放比例
            CGFloat navH = SCREEN_HEIGHT - 2* 60;
            CGFloat scale = navH / SCREEN_HEIGHT;
            //        菜单左边的间距
            CGFloat leftMenumargin = SCREEN_WIDTH * (1 - scale) / 2;
            CGFloat topmargin = SCREEN_HEIGHT * (1 - scale) / 2;
            CGFloat translateX = leftMenumargin - _rightMenu.view.width;
            CGFloat translateY = topmargin - 60;
            //缩放
            CGAffineTransform form = CGAffineTransformMakeScale(scale, scale);
            //        平移
            CGAffineTransform transform = CGAffineTransformTranslate(form, translateX / scale, -translateY /scale);
            //  CGAffineTransform form = CGAffineTransformMakeTranslation(200, 0);
            //self.navigationController.view.transform = transform;
            showingView.transform = transform;
            //     self.navigationController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
            //                添加一个遮盖
            UIButton *cover = [[UIButton alloc]init];
            [cover addTarget:self action:@selector(coverClciked:) forControlEvents:(UIControlEventTouchUpInside)];
            //        给遮盖添加一个Tag值 此处不写 当创建遮盖之后 点击左边返回遮盖不会消失 需要点击两次才返回 第一次是移除遮盖
            cover.tag = WYCoverTag;
            cover.frame = showingView.bounds;
            [showingView addSubview:cover];
    }];

}
//点击cover 覆盖 navigation视图 不能点击
-(IBAction)coverClciked:(UIButton*)sender{
    //
    [UIView animateWithDuration:WYNavShowAnimDuration animations:^{
        //清空transform
//        self.navigationController.view.transform = CGAffineTransformIdentity;
        showingNavigationController.view.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        [sender removeFromSuperview];
    }];
}

#pragma mark -
#pragma mark 数据请求

#pragma mark -
#pragma mark 代理
-(void)leftMenu:(WYLeftMenu *)menu didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toindex{
//    0 取出当前正在显示的控制器  移除旧控制器的view
   WYNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
//  1  取出即将要显示的导航控制器
    WYNavigationController *willShowNav = self.childViewControllers[toindex] ;
//    这句代码不能放在后面  先添加到view视图  在改变transform
    [self.view addSubview:willShowNav.view];
    // 设置新控制的transform跟旧控制器一样
    willShowNav.view.transform = oldNav.view.transform;
    // 2.设置当前正在显示的控制器
    showingNavigationController = willShowNav;
     // 设置阴影
   willShowNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    willShowNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    willShowNav.view.layer.shadowOpacity = 0.2;
    
    // 一个导航控制器的view第一次显示到它的父控件上时，如果transform的缩放值被改了，上面的20高度当时是不会出来  所以新添加的控制器的view应该先添加到view视图  在改变transform
    
    
     // 3.清空transform 还原动画效果
//    [UIView animateWithDuration:WYNavShowAnimDuration animations:^{
//        willShowNav.view.transform = CGAffineTransformIdentity;
//    }];
    // 4.清除当前正在显示的控制器上面的遮盖
//    [[willShowNav.view viewWithTag:WYCoverTag]removeFromSuperview];

    //5.点击遮盖   这句代码直接清空transform和遮盖
    [self coverClciked:[willShowNav.view viewWithTag:WYCoverTag]];
}
#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁
-(UIStatusBarStyle)preferredStatusBarStyle{
    //设置电量条为白色
    return UIStatusBarStyleLightContent;
}


@end
