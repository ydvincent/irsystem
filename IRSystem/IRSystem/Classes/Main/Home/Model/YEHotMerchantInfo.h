//
//  YEHotMerchantInfo.h
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  热门商家
 */
@interface YEHotMerchantInfo : NSObject

@property (nonatomic, strong) NSString *streetid;
@property (nonatomic, strong) NSString *cityname;
@property (nonatomic, strong) NSString *servertime;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *provincename;
@property (nonatomic, strong) NSString *telephone;
@property (nonatomic, strong) NSString *typename;
@property (nonatomic, strong) NSNumber *score;

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSString *typeiid;
@property (nonatomic, strong) NSString *streetname;
@property (nonatomic, strong) NSString *villagename;

@property (nonatomic, strong) NSString *typenname;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *provinceid;
@property (nonatomic, strong) NSString *cityid;

@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *picurl;
@property (nonatomic, strong) NSString *districtname;

@property (nonatomic, strong) NSString *villageid;
@property (nonatomic, strong) NSString *districtid;
@property (nonatomic, strong) NSNumber *typeid;
@property (nonatomic, strong) NSString *address;

@end
