//
//  DCRouteEngine.m
//  DCRouter
//
//  Created by dingchao on 16/2/23.
//  Copyright © 2016年 dingc. All rights reserved.
//

#import "DCRouteEngine.h"
#import "DCRouterConfigration.h"
#import "DCRouterStyleHandle.h"

@implementation DCRouteEngine

+(BOOL)dc_routeURLString:(NSString *)urlString {
    
    return [self dc_routeURL:[NSURL URLWithString:urlString]];
}

+ (BOOL)dc_routeURL:(NSURL *)url {
    BOOL ishandledLink = NO;
    /*  
        1、验证 url是不是存在
        2、判断ROUTE_PATH_HANDLE_CLASS 是不是遵从 DCRouterStyleHandleProtocol 协议 
        3、url 能不能通过 ROUTE_PATH_HANDLE_CLASS 的实例的验证
     */
    if (url &&
        [[NSClassFromString(DC_ROUTE_PATH_HANDLE_CLASS) class] conformsToProtocol:@protocol(DCRouterStyleHandleProtocol)]) {
        id<DCRouterStyleHandleProtocol> styleHnadle = [NSClassFromString(DC_ROUTE_PATH_HANDLE_CLASS) dc_instance];
        if ([styleHnadle dc_verifyPathStyle:url.absoluteString]) {
            ishandledLink = [styleHnadle dc_handlePathStyle:url.absoluteString];
        }
    }
    return ishandledLink;
}

@end
