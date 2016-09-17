//
//  YERequest.h
//  IRSystem
//
//  Created by Vincent on 16/9/15.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

typedef NS_ENUM(NSInteger , YERequestStatus) {
    //正常
    YERequestStatusSuccess        = 1,
    YERequestStatusAuthFailed     = -1, //请求参数异常(auth失败)
    YERequestStatusParamFailed    = -2, //请求参数异有空值(业务参数)
    YERequestStatusParamRuleError = -3, //参数的值不符合规则
    YERequestStatusSignError      = -4,      //权限错误 SIGN规则不符合
    YERequestStatusNoPermissions  = -5,      //用户没有该方法的权限
    //网络失败
    YERequestStatusFailed,
};

typedef void (^YERequestBlock)(YERequestStatus requestStatus, NSString *message, id responseObject);



@interface YERequest : YTKRequest

/**
 *  (封装层) 发起网络请求, 返回自定义对象时需要子类调用
 *  子类可重写该方法, 实现对参数的逻辑判断
 *  只要调用本方法, requestBlock必须传递
 *
 *  @param requestBlock 返回参数 回调
 */
- (void)startRequest:(YERequestBlock)requestBlock;

/**
 *  (封装层) 解析, 根据statusCode解析message
 *  因为服务器返回的是英文信息, 客户端需要转成中文
 *
 *  @param statusCode 服务端, 服务状态 code
 *
 *  @return 提示信息(默认返回@"")
 */
- (NSString *)formatMessage:(YERequestStatus)statusCode;

/**
 *  (封装层) 解析，把服务器返回数据转换想要的数据
 *
 *  @param responseObject 服务器返回的 json 数据(默认返回 body -> data)
 *
 *  @return 封装后的数据(body -> data)
 */
- (id)formatResponseObject:(id)responseObject;

@end
