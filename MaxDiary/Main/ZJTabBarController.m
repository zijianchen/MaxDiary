//
//  ZJTabBarController.m
//  MaxDiary
//
//  Created by max on 2019/2/28.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import "ZJTabBarController.h"

// Controllers
#import "ZJNavigationController.h"


// Models
#import "ZJTabBar.h"

@interface ZJTabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    
    [self setUpTabBar];
    
    [self addDcChildViewContorller];
    // Do any additional setup after loading the view.
}

#pragma mark - 更换系统的tabbar
-(void)setUpTabBar {
    ZJTabBar *tabBar = [[ZJTabBar alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    // KVC:把系统tabBar换成自定义tabBar
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加子控制器
- (void)addDcChildViewContorller {
    // tabBar icon 大小为 size = 30 × 30
    NSArray *childArray = @[
                            @{TabClassKey  : @"ZJHomeViewController",
                              TabTitleKey  : @"首页",
                              TabImgKey    : @"tabr_01_up",
                              TabSelImgKey : @"tabr_01_down"},
                            
                            @{TabClassKey  : @"ZJCalendarViewController",
                              TabTitleKey  : @"日历",
                              TabImgKey    : @"tabr_02_up",
                              TabSelImgKey : @"tabr_02_down"},

                            @{TabClassKey  : @"ZJWriteViewController",
                              TabTitleKey  : @"写笔记",
                              TabImgKey    : @"tabr_03_up",
                              TabSelImgKey : @"tabr_03_down"},
                            
                            ];
    
    // 使用enumerateObjectsUsingBlock遍历
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(dict[TabClassKey]) new];
        vc.navigationItem.title = dict[TabTitleKey];
        
        ZJNavigationController *nav = [[ZJNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.image = [[UIImage imageNamed:dict[TabImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:dict[TabSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0); //（当只有图片的时候）需要自动调整图片位置
        item.title = dict[TabTitleKey];
        
        [self addChildViewController:nav];
        
    }];
    
}

#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    // 添加点击tabBarItem的动画
    [self tabBarButtonClick:[self getTabBarButton]];
}

#pragma mark - 点击tabBar动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            // 需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            // 添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}

- (UIControl *)getTabBarButton {
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}

#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait; // 只支持这一个方向(正常的方向)
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
