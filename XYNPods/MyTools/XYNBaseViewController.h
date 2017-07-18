//
//  XYNBaseViewController.h
//  XDPodDemo
//
//  Created by DingJia on 2017/5/31.
//  Copyright © 2017年 席亚楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationItem+CustomItem.h" 

/**
 使用方法：
 
 1、新创建的 viewController 必须继承该类。
 
 2、给导航栏中间 item 设置文字，同时不需要设置点击事件
 [self setNavigationItemMiddleTitle:@"首页"];
 
 3、给导航栏左边 item 设置文字，同时设置点击事件
 CustomBarItem * leftItem = [self setNavigationItemLeftTitle:@"左边"];
 [leftItem addTarget:self selector:@selector(leftItemClicked) event:(UIControlEventTouchUpInside)];
 
 4、给导航栏右边 item 设置文字，同时设置点击事件
 CustomBarItem * rightItem = [self setNavigationItemRightTitle:@"右边"];
 [rightItem addTarget:self selector:@selector(rightItemClicked) event:(UIControlEventTouchUpInside)];
 
 */
@interface XYNBaseViewController : UIViewController

/// 设置导航栏左边 item, 文字 or 图片
- (CustomBarItem *)setNavigationItemLeftTitle:(NSString *)title
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                    imageName:(NSString *)imageName
                                       offset:(CGFloat)offset
                                   clickBlock:(void(^)())clickBlock;

/// 设置导航栏右边 item, 文字 or 图片
- (CustomBarItem *)setNavigationItemRightTitle:(NSString *)title
                                          font:(UIFont *)font
                                         color:(UIColor *)color
                                     imageName:(NSString *)imageName
                                        offset:(CGFloat)offset
                                    clickBlock:(void(^)())clickBlock;

/// 设置导航栏中间 item, 文字 or 图片
- (CustomBarItem *)setNavigationItemMiddleTitle:(NSString *)title
                                           font:(UIFont *)font
                                          color:(UIColor *)color
                                      imageName:(NSString *)imageName
                                         offset:(CGFloat)offset
                                     clickBlock:(void(^)())clickBlock;

/// 设置导航栏左边 item, 自定义 view
- (CustomBarItem *)setNavigationItemLeftCustomView:(UIView *)view;

/// 设置导航栏右边 item, 自定义 view
- (CustomBarItem *)setNavigationItemRightCustomView:(UIView *)view;

/// 设置导航栏中间 item, 自定义 view
- (CustomBarItem *)setNavigationItemMiddleCustomView:(UIView *)view;

/// 设置导航栏中间 item 文字, 使用默认字体、颜色、大小、位置
- (CustomBarItem *)setNavigationItemMiddleTitle:(NSString *)navigationItemMiddleTitle;

/// 设置导航栏左边 item 文字, 使用默认字体、颜色、大小、位置
- (CustomBarItem *)setNavigationItemLeftTitle:(NSString *)navigationItemLeftTitle;

/// 设置导航栏右边 item 文字, 使用默认字体、颜色、大小、位置
- (CustomBarItem *)setNavigationItemRightTitle:(NSString *)navigationItemRightTitle;

/// 返回按钮事件，默认 popViewControllerAnimated，可在子类中重写
- (void)backItemClick;

///隐藏背景图片
- (void)hiddenBgImageView;

//加载空数据的底图
- (void)showEmptyDataWithYOffset:(CGFloat)YOffset showText:(NSString *)text toView:(UIView *)view RemoveBlock:(void(^)())removeBlock;

//加载网络请求失败的底图
- (void)showNetworkRequestFailedWithYOffset:(CGFloat)tYOffset toView:(UIView *)view RemoveBlock:(void(^)())removeBlock restoreBlock:(void(^)())restoreBlock;

- (void)hiddenNoDataView;

- (void)hiddenNetworkFault;

@end
