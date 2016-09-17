//
//  YENewsInfo.h
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YENewsInfo : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, strong) NSString *imgurl;
@property (nonatomic, strong) NSNumber *createdate;

@end
