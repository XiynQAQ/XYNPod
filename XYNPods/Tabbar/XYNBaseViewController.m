//
//  XYNBaseViewController.m
//  XDPodDemo
//
//  Created by DingJia on 2017/5/31.
//  Copyright © 2017年 席亚楠. All rights reserved.
//
#define DefaultNavigationTitleSize 19
#define DefaultFont(fontsize) SystemVersion >= 9.0 ? [UIFont fontWithName:@"PingFangSC-Light" size:(fontsize)] : [UIFont systemFontOfSize:(fontsize)]


#import "XYNBaseViewController.h"
@interface XYNBaseViewController ()

@property (nonatomic, copy) void(^leftItemClickBlock)();
@property (nonatomic, copy) void(^middleItemClickBlock)();
@property (nonatomic, copy) void(^rightItemClickBlock)();
@property (nonatomic, strong) UIImageView * bgImageV;


@end

@implementation XYNBaseViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    
    [self loadBgImageView];
}

- (void)loadBgImageView {
//    UIImageView * bgImage = [[UIImageView alloc] init];
//    [bgImage sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"矩形-1-拷贝-11"]];
//    [self.view insertSubview:bgImage atIndex:0];
//    self.bgImageV = bgImage;
//    
//    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.right.mas_equalTo(0);
//    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //开启右滑返回
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)hiddenBgImageView {
    [self.bgImageV removeFromSuperview];
}

- (void)setupNavigationBar {
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    
    if ([self.navigationController.viewControllers indexOfObject:self] > 0) {
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 0, 20, 60);
        //        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [backBtn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, - 4, 0, 0)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem.title = @"返回";
    }
    
    //    self.navigationController.navigationBar.translucent = NO;
    //    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:33.0/255.0 green:34.0/255.0 blue:36.0/255.0 alpha:255.0/255.0];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

-(UIButton *)addNavgationRightButtonWithFrame:(CGRect)frame
                                        title:(NSString*)title
                                        Image:(NSString*)image
                                  selectedIMG:(NSString*)imsel
                                      tartget:(id)target
                                       action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imsel] forState:UIControlStateSelected];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    //创建Item
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    //button.frame = CGRectMake(0, 0, 40, 30);
    self.navigationItem.rightBarButtonItem = item;
    return button;
}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - ↓ Setter and Getter

- (CustomBarItem *)setNavigationItemLeftTitle:(NSString *)title
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                    imageName:(NSString *)imageName
                                       offset:(CGFloat)offset
                                   clickBlock:(void(^)())clickBlock {
    CustomBarItem * item = nil;
    if (title.length) {
        if (!font) {
            font = [UIFont systemFontOfSize:DefaultNavigationTitleSize];
        }
        item = [self.navigationItem setItemWithTitle:title textColor:color font:font itemType:left];
    } else {
        CGSize size = CGSizeMake(44, 44);
        item = [self.navigationItem setItemWithImage:imageName size:size itemType:left];
    }
    
    if (clickBlock) {
        self.leftItemClickBlock = clickBlock;
        [item addTarget:self selector:@selector(leftItemClick) event:UIControlEventTouchUpInside];
    }
    
    if (offset != 0) {
        [item setOffset:offset];
    }
    
    return item;
}

- (CustomBarItem *)setNavigationItemRightTitle:(NSString *)title
                                          font:(UIFont *)font
                                         color:(UIColor *)color
                                     imageName:(NSString *)imageName
                                        offset:(CGFloat)offset
                                    clickBlock:(void(^)())clickBlock {
    CustomBarItem * item = nil;
    if (title.length) {
        if (!font) {
            font = [UIFont systemFontOfSize:DefaultNavigationTitleSize];
        }
        item = [self.navigationItem setItemWithTitle:title textColor:color font:font itemType:right];
    } else {
        CGSize size = CGSizeMake(44, 44);
        item = [self.navigationItem setItemWithImage:imageName size:size itemType:right];
    }
    
    if (clickBlock) {
        self.rightItemClickBlock = clickBlock;
        [item addTarget:self selector:@selector(rightItemClick) event:UIControlEventTouchUpInside];
    }
    
    if (offset != 0) {
        [item setOffset:offset];
    }
    
    return item;
}

- (CustomBarItem *)setNavigationItemMiddleTitle:(NSString *)title
                                           font:(UIFont *)font
                                          color:(UIColor *)color
                                      imageName:(NSString *)imageName
                                         offset:(CGFloat)offset
                                     clickBlock:(void(^)())clickBlock {
    CustomBarItem * item = nil;
    if (title.length) {
        if (!font) {
            font = [UIFont systemFontOfSize:DefaultNavigationTitleSize];
        }
        item = [self.navigationItem setItemWithTitle:title textColor:color font:font itemType:center];
    } else {
        CGSize size = CGSizeMake(44, 44);
        item = [self.navigationItem setItemWithImage:imageName size:size itemType:center];
    }
    
    if (clickBlock) {
        self.middleItemClickBlock = clickBlock;
        [item addTarget:self selector:@selector(middleItemClick) event:UIControlEventTouchUpInside];
    }
    
    if (offset != 0) {
        [item setOffset:offset];
    }
    
    return item;
}

- (CustomBarItem *)setNavigationItemLeftCustomView:(UIView *)view {
    CustomBarItem * item = [self.navigationItem setItemWithCustomView:view itemType:left];
    return item;
}

- (CustomBarItem *)setNavigationItemRightCustomView:(UIView *)view {
    CustomBarItem * item = [self.navigationItem setItemWithCustomView:view itemType:right];
    return item;
}

- (CustomBarItem *)setNavigationItemMiddleCustomView:(UIView *)view {
    CustomBarItem * item = [self.navigationItem setItemWithCustomView:view itemType:center];
    return item;
}

- (CustomBarItem *)setNavigationItemMiddleTitle:(NSString *)navigationItemMiddleTitle {
    CustomBarItem * item = [self.navigationItem setItemWithTitle:navigationItemMiddleTitle textColor:[UIColor whiteColor] font:[UIFont fontWithName:@"" size:16] itemType:center];
    return item;
}

- (CustomBarItem *)setNavigationItemLeftTitle:(NSString *)navigationItemLeftTitle {
    CustomBarItem * item = [self.navigationItem setItemWithTitle:navigationItemLeftTitle textColor:[UIColor whiteColor] font:[UIFont fontWithName:@"" size:16] itemType:left];
    return item;
}

- (CustomBarItem *)setNavigationItemRightTitle:(NSString *)navigationItemRightTitle {
    CustomBarItem * item = [self.navigationItem setItemWithTitle:navigationItemRightTitle textColor:[UIColor whiteColor] font:[UIFont fontWithName:@"" size:16] itemType:right];
    return item;
}

- (void)leftItemClick {
    if (self.leftItemClickBlock) {
        self.leftItemClickBlock();
    }
}

- (void)middleItemClick {
    if (self.middleItemClickBlock) {
        self.middleItemClickBlock();
    }
}

- (void)rightItemClick {
    if (self.rightItemClickBlock) {
        self.rightItemClickBlock();
    }
}

- (void)showEmptyDataWithYOffset:(CGFloat)YOffset showText:(NSString *)text toView:(UIView *)view RemoveBlock:(void (^)())removeBlock{
    
    if (removeBlock) {
        removeBlock();
    }
    
    UIView *toView = view;
    if (toView == nil) {
        toView = self.view;
    }
}

- (void)showNetworkRequestFailedWithYOffset:(CGFloat)YOffset toView:(UIView *)view RemoveBlock:(void (^)())removeBlock restoreBlock:(void (^)())restoreBlock{
    
//    for (id subView in self.view.subviews) {
//            }
//    
//    if (removeBlock) {
//        removeBlock();
//    }
    
    UIView *toView = view;
    if (toView == nil) {
        toView = self.view;
    }
    
}


@end
