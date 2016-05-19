//
//  WYProfileTableViewController.m
//  WYNew
//
//  Created by qianfeng on 16/1/27.
//  Copyright © 2016年 cl. All rights reserved.
//

#import "WYProfileTableViewController.h"

@interface WYProfileTableViewController ()

@end

@implementation WYProfileTableViewController

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
    // 1.创建按钮
    UIButton *logout = [[UIButton alloc] init];
    // 2.设置属性
    logout.titleLabel.font = [UIFont systemFontOfSize:14];
    [logout setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    [logout setBackgroundImage:[UIImage imageNamed:@"common_card_background"] forState:UIControlStateNormal];
    [logout setBackgroundImage:[UIImage imageNamed:@"common_card_background_highlighted"] forState:UIControlStateHighlighted];
    // 3.设置尺寸(tableFooterView和tableHeaderView的宽度跟tableView的宽度一样)
    logout.height = 35;
    self.tableView.tableFooterView = logout;
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
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
