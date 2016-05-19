//
//  WTNArticalTableViewCell.h
//  WhatTheNews
//
//  Created by qianfeng on 15/12/25.
//  Copyright © 2015年 cl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTNArticalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
