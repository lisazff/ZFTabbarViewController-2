//
//  ZFTabBarController.m
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#import "ZFTabBarController.h"
#import "ZFTabBar.h"
#import "ZFBarButton.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"


#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface ZFTabBarController () <ZFTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) ZFTabBar *customTabBar;
@end

@implementation ZFTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初始化tabbar
    [self setupTabbar];
    
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setupTabbar{
    ZFTabBar *customTabBar = [[ZFTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

- (void)tabBar:(ZFTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}

- (void)setupAllChildViewControllers{
   
    FirstViewController *home = [[FirstViewController alloc] init];
    home.tabBarItem.badgeValue = @"N";
    [self setupChildViewController:home title:@"第一页" imageName:@"homeIcon" selectedImageName:@"homeIconSelected"];
    
    // 2.消息
    SecondViewController *message = [[SecondViewController alloc] init];
    message.tabBarItem.badgeValue = @"8";
    [self setupChildViewController:message title:@"第二页" imageName:@"chatIcon" selectedImageName:@"chatIconSelected"];
    
    // 3.首页
    ThirdViewController *home1 = [[ThirdViewController alloc] init];
    home1.tabBarItem.badgeValue = @"19";
    [self setupChildViewController:home1 title:@"第三页" imageName:@"extend" selectedImageName:@"extendSelected"];
    
    // 4.消息
    ForthViewController *message1 = [[ForthViewController alloc] init];
    message1.tabBarItem.badgeValue = @"99";
    [self setupChildViewController:message1 title:@"第四页" imageName:@"briefcase" selectedImageName:@"briefcaseSelected"];
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

@end

