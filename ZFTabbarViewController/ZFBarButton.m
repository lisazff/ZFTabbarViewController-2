//
//  ZFBarButton.m
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 图标的比例
#define ZFTabBarButtonImageRatio 0.6

// 按钮的默认文字颜色
#define  ZFTabBarButtonTitleColor (iOS7 ? [UIColor blackColor] : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  ZFTabBarButtonTitleSelectedColor [UIColor blueColor]

#import "ZFBarButton.h"

@interface ZFBarButton()

@end

@implementation ZFBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter; //图片内容居中模式
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:ZFTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:ZFTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
 
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {}

//返回image边界
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * ZFTabBarButtonImageRatio;
    return CGRectMake(0, 3, imageW, imageH-3);
}

//返回title边界
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * ZFTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY+2, titleW, titleH);
}

// 设置item
- (void)setItem:(UITabBarItem *)item{
    _item = item;
    
    //NSKeyValueObserver  添加KVO 监听  直接走KVO 的代理方法
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc{ //移除键值监听
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //没有使用 新值
    
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}
@end
