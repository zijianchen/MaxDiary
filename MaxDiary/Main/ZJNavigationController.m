//
//  ZJNavigationController.m
//  MaxDiary
//
//  Created by max on 2019/2/28.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import "ZJNavigationController.h"

@implementation ZJNavigationController

#pragma mark - load
+ (void)load {
    [self setUpBase];
}

#pragma mark - 初始化
+ (void)setUpBase {
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = RGBA(119, 201, 247, 1.0);
    [bar setShadowImage:[UIImage new]];
    [bar setTintColor:[UIColor clearColor]];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor * naiColor = [UIColor whiteColor];
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = PFR18Font;
    bar.titleTextAttributes = attributes;
}

#pragma mark - push
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count >= 1) {
        // 返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
        // 隐藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 跳转
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 点击
- (void)backClick {
    [self popViewControllerAnimated:YES];
}

@end
