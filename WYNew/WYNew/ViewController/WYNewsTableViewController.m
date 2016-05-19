//
//  WYNewsTableViewController.m
//  WYNew
//
//  Created by qianfeng on 16/1/23.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYNewsTableViewController.h"
#import "WYTitleView.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "WTNArticalTableViewCell.h"
#import "WTNArticalService.h"
#import "WTNNewsResultModel.h"
#import "ADScrollView.h"
#import "WTNADService.h"
#import "WTNArticalDetailViewController.h"
#import "WTNDetailViewController.h"
static NSString *identifier1 = @"cell1";
@interface WYNewsTableViewController (){
    NSMutableArray *_newsArr;
    ADScrollView *_adScrollView;
    WTNStoryModel * _storyModel;
    WTNNewsResultModel *_resultModel;
    NSString * _date;
    UIGestureRecognizer *_imageTap;
    BOOL _isLoading;
    NSString *_strTime;
    NSString *_dateTime;
    //    加载更多界面需要使用
    int i;
}


@end

@implementation WYNewsTableViewController
-(NSMutableArray*)newsArr{
    if (!_newsArr) {
        _newsArr = [NSMutableArray array];
    }
    return _newsArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
    [self loadADdata];
    //封装titlebutton
//    UIButton *button = [[UIButton alloc]init];
//    button.width = 100;
//    button.height = 35;
//    button.userInteractionEnabled = NO;
//    [button setImage:[UIImage imageNamed:@"navbar_netease"] forState:(UIControlStateNormal)];
//    [button setTitle:@"新闻" forState:(UIControlStateNormal)];
//    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//    button.titleLabel.font = [UIFont systemFontOfSize:22];
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
//    self.navigationItem.titleView = button;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark 初始化UI
-(void)configUI{
    [self createADScrollView];
    [self refresh];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"WTNArticalTableViewCell" bundle:nil] forCellReuseIdentifier:identifier1];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;

/**
 封装到main控制器 设置标题 和按钮
 */
//    1 标题
//  WYTitleView *titleView = [[WYTitleView alloc]init];
//    titleView.width = 100;
//    titleView.height = 35;
 //   titleView.title = @"新闻";
//    self.navigationItem.titleView = titleView;
//    2 左右的按钮
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(leftBtnClicked:)];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" target:self action:@selector(rightBtnClicked:)];
}
//创建广告栏
-(void)createADScrollView{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 180)];
    self.tableView.tableHeaderView = headerView;
    _adScrollView = [[ADScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-0, 180)];
    [_adScrollView reloadData];
    [headerView addSubview:_adScrollView]; //放在后面滚动点不出现
    //增加图片点击事件
    _imageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapClicked:)];
    [headerView addGestureRecognizer:_imageTap];
    
}
//三方库刷新
-(void)refresh{
    // 三方库刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.tableView.header isRefreshing]) {
                [self.tableView.header endRefreshing];
            }
        });
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadMore];
            if ([self.tableView.footer isRefreshing]) {
                [self.tableView.footer endRefreshing];
            }
        });
    }];
}

#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件
//-(IBAction)leftBtnClicked:(id)sender{
//    
//        // CGAffineTransformMakeTranslation 每次都是以最初位置的中心点为起始参照
//        //    CGAffineTransformTranslate每次都是以传入的transform为起始参照
//            [UIView animateWithDuration:0.5 animations:^{
//            if (CGAffineTransformIsIdentity(self.navigationController.view.transform)) {
//            //        缩放比例
//            CGFloat navH = SCREEN_HEIGHT - 2* 60;
//            CGFloat scale = navH / SCREEN_HEIGHT;
//            //        菜单左边的间距
//            CGFloat leftMenumargin = SCREEN_WIDTH * (1 - scale) / 2;
//            CGFloat topmargin = SCREEN_HEIGHT * (1 - scale) / 2;
//            CGFloat translateX = 200 -leftMenumargin;
//            CGFloat translateY = topmargin - 60;
//            //缩放
//            CGAffineTransform form = CGAffineTransformMakeScale(scale, scale);
//            //        平移
//            CGAffineTransform transform = CGAffineTransformTranslate(form, translateX / scale, -translateY /scale);
//            //  CGAffineTransform form = CGAffineTransformMakeTranslation(200, 0);
//            self.navigationController.view.transform = transform;
//            //     self.navigationController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
////                添加一个遮盖
//            UIButton *cover = [[UIButton alloc]init];
//            [cover addTarget:self action:@selector(coverClciked:) forControlEvents:(UIControlEventTouchUpInside)];
//            cover.frame = self.navigationController.view.bounds;
//            [self.navigationController.view addSubview:cover];
//        }
//            else{
//                self.navigationController.view.transform = CGAffineTransformIdentity;
//            }
//        }];
//
//}
-(IBAction)rightBtnClicked:(id)sender{
    
}
//点击cover 覆盖 navigation视图 不能点击
//-(IBAction)coverClciked:(UIButton*)sender{
//    //
//    [UIView animateWithDuration:0.5 animations:^{
//        //清空transform
//         self.navigationController.view.transform = CGAffineTransformIdentity;
//        
//    }completion:^(BOOL finished) {
//        [sender removeFromSuperview];
//    }];
//}
-(IBAction)imageTapClicked:(UIGestureRecognizer *)sender{
    NSLog(@"点击了");
    WTNDetailViewController *wdvc = [[WTNDetailViewController alloc]init];
    //  ADvc.imageUrl = _adScrollView.imageUrl;
    wdvc.imageUrl = _adScrollView.imageUrl;
    //    view 为点击事件的对象
    [self.navigationController pushViewController:wdvc animated:YES];
    
}

#pragma mark -
#pragma mark 数据请求
-(void)loadADdata{
    [[WTNADService new]getADImageList:^(id data) {
        _adScrollView.imageArr = data;
        [_adScrollView reloadData];
    }];
    // 图片上的文字
    [[WTNADService new]getADLabelList:^(id data) {
        _adScrollView.labelArr = data;
        [_adScrollView reloadData];
    }];
    [[WTNADService new]getADdetail:^(id data) {
        // _adScrollView.imageUrlArr = data;
        _adScrollView.imageUrlArr = data;
        [_adScrollView reloadData];
    }];
    
}
-(void)loadData{
    i = 1;
    __weak typeof(*&self)blockSelf = self;
    _strTime = @"latest";
    _dateTime = @"?client=0";
    [[WTNArticalService new]getArticalListByTime:_strTime Date:_dateTime complete:^(id data) {
        if ([self.tableView.header isRefreshing]) {
            [self.tableView.header endRefreshing];
        }
        _newsArr = data;
        [blockSelf.tableView reloadData];
    }];
}
-(void)loadMore{
    
    __weak typeof(*&self)blockSelf = self;
    //创建一个时间戳对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    formatter.dateFormat = @"yyyyMMdd";
    NSDate *date = [NSDate date];
    _strTime = @"before/";
    NSString *str1 = @"?client=0";
    //<4>以date时间为基准过了多少秒之后的时间 【掌握】
    NSDate *date1 = [NSDate  dateWithTimeInterval:-i*24*60*60 sinceDate:date];
    //把时间对象转换成字符串对象
    NSString *dateString = [formatter  stringFromDate:date1];
    _dateTime = [NSString stringWithFormat:@"%@%@",dateString,str1];
    [[WTNArticalService new]getArticalListByTime:_strTime Date:_dateTime complete:^(id data) {
        if ([self.tableView.footer isRefreshing]) {
            [self.tableView.footer endRefreshing];
        }
        [_newsArr addObjectsFromArray:data];
        [blockSelf.tableView reloadData];
    }];
    i++;
}

#pragma mark -
#pragma mark 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _newsArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WTNArticalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1 forIndexPath:indexPath];
    WTNStoryModel *model = _newsArr[indexPath.row];
    [cell.newsImageView sd_setImageWithURL:[NSURL URLWithString:[model.images firstObject]] placeholderImage:[UIImage imageNamed:@"sports"]];
    cell.titleLabel.text = model.title;
    
    //创建一个时间戳对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [NSDate date];
    //把时间对象转换成字符串对象
    NSString *dateString = [formatter  stringFromDate:date];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@",dateString];
    return cell;
}
//选中一行跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //在sprots.storyBoard 设置 view controller继承 FootballDetailViewController  storyBoard ID 为 FootballDetailViewController
    WTNArticalDetailViewController *ADvc = [[WTNArticalDetailViewController alloc]init];
    ADvc.storyModel = _newsArr[indexPath.row];
    //点击跳转到下一个页面之前 隐藏底部栏
    ADvc.hidesBottomBarWhenPushed  = YES;
    [self.navigationController pushViewController:ADvc animated:YES];
}

#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁



@end
