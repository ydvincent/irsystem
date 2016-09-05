//
//  YEAppMgr.m
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEAppMgr.h"

#import "AppDelegate.h"
#import "YELoginViewController.h"

static YEAppMgr *_manager = nil;

@implementation YEAppMgr

+ (YEAppMgr *)manager
{
    if (_manager == nil) {
        _manager = [[YEAppMgr alloc] init];
    }
    return _manager;
}

+ (void)clean
{
    _manager = nil;
}

// 设置主window的RootVC
- (void)configWindowRootVC
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    YELoginViewController *vc = [[YELoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //nav.navigationBarHidden = YES;
    app.window.rootViewController = nav;
    app.window.backgroundColor = [UIColor whiteColor];
}



@end
