//
//  YEDiscoveryMainViewController.m
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEDiscoveryMainViewController.h"

#import "YEGetDiscoveyListApi.h"

@interface YEDiscoveryMainViewController ()

@end

@implementation YEDiscoveryMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestDiscoveyList];
}

#pragma mark - API

- (void)requestDiscoveyList
{
    [self.view showHUD];
    YEGetDiscoveyListApi *api =[[YEGetDiscoveyListApi alloc] init];
    
    [api startRequest:^(YERequestStatus responseStatus, NSString *message, id responseObject) {
        
        [self.view hideHUD];
        if (responseStatus == YERequestStatusSuccess) {
            
        } else {
            
        }
    }];
}

@end
