//
//  DCRouteEngine.h
//  DCRouter
//
//  Created by dingchao on 16/2/23.
//  Copyright © 2016年 dingc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCRouteEngine : NSObject


+ (BOOL)dc_routeURLString:(NSString *)url;
+ (BOOL)dc_routeURL:(NSURL *)url;
@end
