//
//  MTRouterModel.m
//  Customer‘sHipster
//
//  Created by dingchao on 15/8/28.
//  Copyright (c) 2015年 dingc. All rights reserved.
//

#import "DCRouterModel.h"
#import "MTLReflection.h"

@implementation DCRouterModel

+ (id)getModelWithType:(NSString *)type vauleDictionary:(NSDictionary *)vauleDictionary {
    SEL selector = MTLSelectorWithCapitalizedKeyPattern("get", type, "ModelWithVauleDictionary:");
    if ([[self class] respondsToSelector:selector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] methodSignatureForSelector:selector]];
        invocation.target = [self class];
        invocation.selector = selector;
        [invocation setArgument:&vauleDictionary atIndex:2];
        [invocation invoke];
        
        __unsafe_unretained id result = nil;
        [invocation getReturnValue:&result];
        return result;
    }
    if ([[self class] respondsToSelector:@selector(getNormalModelWithType:vauleDictionary:)]) {
        return [[self class] getNormalModelWithType:type vauleDictionary:vauleDictionary];
    }
    return nil;
}

+ (UIViewController *)handleControlWithType:(NSString *)type model:(id)model {
    SEL selector = MTLSelectorWithCapitalizedKeyPattern("open", type, "WithModel:");
    if ([[self class] respondsToSelector:selector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] methodSignatureForSelector:selector]];
        invocation.target = [self class];
        invocation.selector = selector;
        [invocation setArgument:&model atIndex:2];
        [invocation invoke];
        
        __unsafe_unretained id result = nil;
        [invocation getReturnValue:&result];
        return result;
    }
    return nil;
}

+ (BOOL)handleShowControllerWithType:(NSString *)type {
    SEL selector = MTLSelectorWithCapitalizedKeyPattern("present", type, "VC");
    BOOL isPresent = NO;
    if ([[self class] respondsToSelector:selector]) {
        isPresent = YES;
    }
    return isPresent;
}

+ (id)getNormalModelWithType:(NSString *)type vauleDictionary:(NSDictionary *)vauleDictionary {
    return nil;
}

@end
