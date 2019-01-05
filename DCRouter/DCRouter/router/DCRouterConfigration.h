//
//  DCRouterConfigration.h
//  DCRouter
//
//  Created by dingchao on 16/2/23.
//  Copyright © 2016年 dingc. All rights reserved.
//

#ifndef DCRouterConfigration_h
#define DCRouterConfigration_h

// 在Debug环境下输出NSLog的内容，在Release的环境下不输出
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


// 在Debug环境下输出NSLog的内容，在Release的环境下不输出
#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#else
#define DLog(...) /* */
#endif

// 一直都输出
#define ALog(...) NSLog(__VA_ARGS__)

#endif /* DCRouterConfigration_h */

#define DC_ROUTE_PATH_HANDLE_CLASS     @"DCRouterURLStyleHandle"

#define DC_ROUTE_HOST_WHITE_LIST       @[@"miot.cn", @"yunzhanggui.net",@"yunzhanggui.com"]

#define DC_ROUTE_URL_SCHEME @"sheme"           //config your scheme
/* pass your path style eg :
 *1、sheme://method.host/key/vaule... (zhihu://detail.zhihu.com/id/1532)
 *2、sheme://method/[key]vaule        (zhihu://detail/1532)
 */
#define ROUTE_URL_PATH_STYLE @"sheme://method.host/key/vaule..."
