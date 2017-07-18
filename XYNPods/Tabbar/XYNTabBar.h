//
//  XYNTabBar.h
//  XDPodDemo
//
//  Created by DingJia on 2017/5/16.
//  Copyright © 2017年 席亚楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYNTabBar;

@protocol XYNTabBarDelegate <NSObject>

@optional
- (void)tabBar:(XYNTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface XYNTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<XYNTabBarDelegate> delegate;

@end
