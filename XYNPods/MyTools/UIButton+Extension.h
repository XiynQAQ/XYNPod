//
//  UIButton+Extension.h
//  TouchStone
//
//  Created by DingJia on 2017/5/16.
//  Copyright © 2017年 席亚楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

IB_DESIGNABLE
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable NSInteger cornerRadius;

/**
 *  Sets the backgroundColor to use for the specified button state.
 *
 *  @param backgroundColor 背景色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@end
