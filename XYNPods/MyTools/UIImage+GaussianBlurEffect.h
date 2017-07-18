//
//  UIImage+GaussianBlurEffect.h
//  GaussianBlurEffect
//
//  Created by DingJia on 2017/5/16.
//  Copyright © 2017年 席亚楠. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImage (GaussianBlurEffect)

-(UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;

@end
