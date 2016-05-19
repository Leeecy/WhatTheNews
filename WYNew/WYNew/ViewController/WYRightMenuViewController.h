//
//  WYRightMenuViewController.h
//  WYNew
//
//  Created by qianfeng on 16/1/24.
//  Copyright © 2016年 cl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYRightMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
/**
 *  右边菜单全部显示出来
 */
- (void)didShow;
@end
