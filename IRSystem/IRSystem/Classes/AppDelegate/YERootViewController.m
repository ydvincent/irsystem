//
//  YERootViewController.m
//  IRSystem
//
//  Created by Vincent on 16/9/14.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YERootViewController.h"

#import "YEHomeViewController.h"
#import "YEDiscoveryMainViewController.h"
#import "YEActivityMainViewController.h"
#import "YEProfileMainViewController.h"

@interface YERootViewController ()

@end

@implementation YERootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildControllers];
}

- (void)setupChildControllers
{
    [self setupChildNavigationControllerWithClass:[UINavigationController class]
                                  tabBarImageName:@"tabbar_home"
                          rootViewControllerClass:[YEHomeViewController class]
                          rootViewControllerTitle:@"首页"];
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class]
                                  tabBarImageName:@"tabbar_disvover"
                          rootViewControllerClass:[YEDiscoveryMainViewController class]
                          rootViewControllerTitle:@"发现"];
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class]
                                  tabBarImageName:@"tabbar_activity"
                          rootViewControllerClass:[YEActivityMainViewController class]
                          rootViewControllerTitle:@"活动"];
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class]
                                  tabBarImageName:@"tabbar_profile"
                          rootViewControllerClass:[YEProfileMainViewController class]
                          rootViewControllerTitle:@"我的"];
    
}

- (void)setupChildNavigationControllerWithClass:(Class)class
                                tabBarImageName:(NSString *)name
                        rootViewControllerClass:(Class)rootViewControllerClass
                        rootViewControllerTitle:(NSString *)title
{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = OrigIMG(name);
    NSString *selectedImage = [NSString stringWithFormat:@"%@_s",name];
    navVc.tabBarItem.selectedImage = OrigIMG(selectedImage);
    [self addChildViewController:navVc];
}


@end
