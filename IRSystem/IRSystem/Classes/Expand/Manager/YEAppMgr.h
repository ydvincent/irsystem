//
//  YEAppMgr.h
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//


@interface YEAppMgr : NSObject

@property (nonatomic, strong) NSString *serverAddress;


+ (YEAppMgr *)manager;

// 配置通用属性
+ (void)configGeneralProperty;

// 设置主window的RootVC
- (void)configWindowRootVC;

@end
