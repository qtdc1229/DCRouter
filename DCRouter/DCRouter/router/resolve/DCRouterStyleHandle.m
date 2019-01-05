//
//  DCRouterStyleHandle.m
//  DCRouter
//
//  Created by dingchao on 16/3/28.
//  Copyright © 2016年 dingc. All rights reserved.
//

#import "DCRouterStyleHandle.h"
#import "DCRouterConfigration.h"


@implementation DCRouterURLStyleHandle

@synthesize scheme = _scheme;

- (NSString *)scheme {
    return DC_ROUTE_URL_SCHEME;
}

+(instancetype)dc_instance {
    static DCRouterURLStyleHandle *__urlStyleHandle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __urlStyleHandle = [[DCRouterURLStyleHandle alloc] init];
    });
    return __urlStyleHandle;
}

- (BOOL)dc_handlePathStyle:(NSString *)urlPath {
    return YES;
}

- (BOOL)dc_verifyPathStyle:(NSString *)urlPath {
    return [DCRouterURLStyleHandle verifyPathStyleWithString:urlPath];
}


+ (BOOL)verifyPathStyleWithString:(NSString *)pathStyle {
    BOOL isVerified = NO;
    NSString *staString = pathStyle;
    NSString *parten = @"(sheme)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,4})(\\:[0-9]+)?(/[^/][a-zA-Z0-9\\.\\,\?\'\\/\\+&amp;%\\$#\\=~_\\-@]*)*";
    NSError* error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:parten options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        NSLog(@"Regular error : %@",error);
        return isVerified;
    }
    NSArray* match = [reg matchesInString:staString options:NSMatchingReportCompletion range:NSMakeRange(0, [staString length])];
    
    if (match.count != 0) {
        isVerified = YES;
        for (NSTextCheckingResult *matc in match) {
            NSRange range = [matc range];
            NSLog(@"%lu,%lu,%@",(unsigned long)range.location,(unsigned long)range.length,[staString substringWithRange:range]);
        }
    }
    return isVerified;
}

@end
