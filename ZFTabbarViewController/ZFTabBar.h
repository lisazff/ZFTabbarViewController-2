//
//  ZFTabBar.h
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZFTabBar;

@protocol ZFTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ZFTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface ZFTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<ZFTabBarDelegate> delegate;

@end

