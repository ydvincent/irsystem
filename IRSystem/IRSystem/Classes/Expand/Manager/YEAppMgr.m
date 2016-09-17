//
//  YEAppMgr.m
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEAppMgr.h"

#import "AppDelegate.h"
#import "YERootViewController.h"

static YEAppMgr *_manager = nil;

@implementation YEAppMgr


#pragma mark - public methods

+ (YEAppMgr *)manager
{
    if (_manager == nil) {
        _manager = [[YEAppMgr alloc] init];
    }
    return _manager;
}

- (id)init
{
    if (self = [super init]) {
        _serverAddress = YEAPIURL;
    }
    return self;
}

+ (void)clean
{
    _manager = nil;
}

// 配置通用属性
+ (void)configGeneralProperty
{
    //设置导航栏背景色
    [[UINavigationBar appearance] setBarTintColor:YENavBarTintColor];
    //设置导航栏文字图片背景颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //设置导航栏 文字颜色、字体大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
                                                               [UIColor whiteColor],
                                                           NSFontAttributeName:
                                                               [UIFont boldSystemFontOfSize:17]}];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
                                                               [UIColor whiteColor],
                                                           NSFontAttributeName:
                                                               [UIFont systemFontOfSize:13]}
                                                forState:UIControlStateNormal];
    
    //tabBar 背景颜色
    //UIImage *tabImg = [Utils createImageWithColor:UIColorFromRGB(0xf9f9f9)];
    //[[UITabBar appearance] setBackgroundImage:tabImg];
    [[UITabBar appearance] setTintColor:YENavBarTintColor];
    
}

// 设置主window的RootVC
- (void)configWindowRootVC
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    YERootViewController *root = [[YERootViewController alloc] init];
    app.window.rootViewController = root;
    app.window.backgroundColor = [UIColor whiteColor];
}


@end
