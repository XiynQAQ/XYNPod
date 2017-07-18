//
//  XYNBadgeButton.m
//  XDPodDemo
//
//  Created by DingJia on 2017/5/16.
//  Copyright © 2017年 席亚楠. All rights reserved.
//

#import "XYNBadgeButton.h"

@implementation XYNBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    //    _badgeValue = badgeValue;
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1) {
            
            NSString *text = badgeValue;
            CGFloat width = 0;
            UIFont *font = self.titleLabel.font;
            NSAttributedString *attributedText =
            [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: font }];
            CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
            CGSize size = rect.size;
            badgeW = size.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
