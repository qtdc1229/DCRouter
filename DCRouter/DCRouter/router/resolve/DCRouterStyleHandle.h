//
//  DCRouterStyleHandle.h
//  DCRouter
//
//  Created by dingchao on 16/3/28.
//  Copyright © 2016年 dingc. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  @brief 用来定义路由规则以及处理方法的接口，如果想要定义一个新的遵循该协议即可
 */
@protocol DCRouterStyleHandleProtocol <NSObject>

@property (nonatomic ,strong ,readonly) NSString *scheme;

+ (instancetype)dc_instance;

- (BOOL)dc_handlePathStyle:(NSString *)urlPath;

- (BOOL)dc_verifyPathStyle:(NSString *)urlPath;

@end
/**
 *  @brief 用于处理普通的url的路由分发类
 */
@interface DCRouterURLStyleHandle : NSObject <DCRouterStyleHandleProtocol>

@end
