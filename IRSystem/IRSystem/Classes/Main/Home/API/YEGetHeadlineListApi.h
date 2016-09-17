//
//  YEGetHeadlineListApi.h
//  IRSystem
//
//  Created by Vincent on 16/9/17.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YERequest.h"

@interface YEGetHeadlineListApi : YERequest

@property (nonatomic, strong) NSNumber *pageno;
@property (nonatomic, strong) NSNumber *pagesize;

@end
