//
//  ZFTabBar.m
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#import "ZFTabBar.h"
#import "ZFBarButton.h"


@interface ZFTabBar()

@property (nonatomic, weak) ZFBarButton *selectedButton; //选中button

@end

@implementation ZFTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        }
    }
    return self;
}

//在tabbar上 添加按钮item
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    ZFBarButton *button = [[ZFBarButton alloc] init];
    [self addSubview:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(ZFBarButton *)button
{
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag]; //设置选中控制器
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.subviews.count; index++) {
        // 1.取出按钮
        ZFBarButton *button = self.subviews[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}
@end
