//
//  WYLeftMenu.h
//  WYNew
//
//  Created by qianfeng on 16/1/20.
//  Copyright © 2016年 cl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYLeftMenu;
@protocol WYLeftMenuDelegate <NSObject>
@optional
-(void)leftMenu:(WYLeftMenu*)menu didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toindex;
@end
@interface WYLeftMenu : UIView
@property (nonatomic, weak)id<WYLeftMenuDelegate> delegate;
@end
