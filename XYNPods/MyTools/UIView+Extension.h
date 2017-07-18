//
//  UIView+Extension.h
//  BikeUser
//
//  Created by DingJia on 2017/5/16.
//  Copyright © 2017年 席亚楠. All rights reserved.
//


#import <UIKit/UIKit.h>

//IB_DESIGNABLE
@interface UIView (Extension)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable NSInteger cornerRadius;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@end
