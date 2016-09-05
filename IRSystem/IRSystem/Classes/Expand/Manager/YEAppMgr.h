//
//  YEAppMgr.h
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//


@interface YEAppMgr : NSObject

+ (YEAppMgr *)manager;

// 设置主window的RootVC
- (void)configWindowRootVC;

@end
