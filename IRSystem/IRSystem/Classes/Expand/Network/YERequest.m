//
//  YERequest.m
//  IRSystem
//
//  Created by Vincent on 16/9/15.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YERequest.h"

@implementation YERequest

#pragma mark - override Getters

- (NSString *)baseUrl
{
    return [[YEAppMgr manager] serverAddress];
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 15;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

- (NSString *)formatMessage:(YERequestStatus)statusCode
{
    NSDictionary *responseJSONObject = (NSDictionary *)self.responseJSONObject;
    return responseJSONObject[YEResponseMsg];
}

- (id)formatResponseObject:(id)responseObject
{
    return responseObject;
}

#pragma mark - override Methods

- (void)startRequest:(YERequestBlock)requestBlock
{
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        [self handleSuccess:requestBlock responseObject:request.responseJSONObject];
        
    } failure:^(YTKBaseRequest *request) {
        [self handleFailure:requestBlock error:request.error];
        
    }];
}

#pragma mark - private Method

- (void)handleSuccess:(YERequestBlock)requestBlock
       responseObject:(id)responseObject
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self printResponseData];
        
        //判断返回的是数据是否为json格式数据
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            // message不可用时为@"", responseObject不可用时为nil
            YERequestStatus status = [[responseObject objectForKey:YEResponseCode] integerValue];
            
            if (status == YERequestStatusSuccess) {
                status = YERequestStatusSuccess;
            } else {
                status = YERequestStatusFailed;
            }
            
            // 返回错误时, 需要解析message。服务器返回的错误没有用, 因为客户端需要显示中文。
            NSString *message = [self formatMessage:status];
            
            id object = [self formatResponseObject:responseObject];
            
            if (requestBlock) {
                requestBlock(status, message, object);
            }
        } else {
            if (requestBlock) {
                requestBlock(YERequestStatusFailed, @"数据异常，请稍候再试", nil);
            }
        }
    });
}

- (void)handleFailure:(YERequestBlock)requestBlock error:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (requestBlock) {
            
            [self printResponseData];
            DLog(@"\n error: \n %@", error);
            
            NSString *msg = @"服务器异常，请稍候再试";
            switch (error.code) {
                case -1000:
                case -1002:
                    msg = @"系统异常，请稍后再试";
                    break;
                case -1001:
                    msg = @"请求超时，请检查您的网络!";
                    break;
                case -1005:
                case -1006:
                case -1009:
                    msg = @"网络异常，请检查您的网络!";
                    break;
                default:
                    break;
            }
            
            requestBlock(YERequestStatusFailed, msg, nil);
        }
    });
}

#pragma mark -

- (void)printResponseData
{
    NSData *jsonData;
    if (self.responseJSONObject) {
        jsonData = [NSJSONSerialization dataWithJSONObject:self.responseJSONObject options:NSJSONWritingPrettyPrinted error:nil];
    }
    
    NSString *jsonString;
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else {
        jsonString = self.responseString;
    }
    //打印完整的 url 和 返回的数据
    DLog(@"\n%@\n%@\n", [[YTKNetworkAgent sharedAgent] buildRequestUrl:self], jsonString);
}

@end
