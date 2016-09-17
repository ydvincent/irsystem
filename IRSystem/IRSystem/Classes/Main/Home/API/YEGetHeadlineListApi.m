//
//  YEGetHeadlineListApi.m
//  IRSystem
//
//  Created by Vincent on 16/9/17.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEGetHeadlineListApi.h"
#import "YENewsInfo.h"

@implementation YEGetHeadlineListApi

- (NSString *)requestUrl
{
    return @"api/news/list";
}

- (id)requestArgument
{
    return @{@"pageno":self.pageno,
             @"pagesize":self.pagesize
             };
}

- (id)formatResponseObject:(id)responseObject
{
    NSDictionary *body = (NSDictionary *)responseObject;
    return [YENewsInfo mj_objectArrayWithKeyValuesArray:body[@"data"]];
}

@end
