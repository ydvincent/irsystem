//
//  YEGetHomeDataApi.m
//  IRSystem
//
//  Created by Vincent on 16/9/15.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEGetHomeDataApi.h"

@implementation YEGetHomeDataApi

- (NSString *)requestUrl
{
    return @"api/index";
}

- (id)formatResponseObject:(id)responseObject
{
    NSDictionary *data = (NSDictionary *)responseObject;
    return data[@"data"];
}

@end
