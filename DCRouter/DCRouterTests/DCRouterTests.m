//
//  DCRouterTests.m
//  DCRouterTests
//
//  Created by dingchao on 16/2/23.
//  Copyright © 2016年 dingc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DCRouteEngine.h"
#import "DCRouterConfigration.h"

@interface DCRouterTests : XCTestCase

@end

@implementation DCRouterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    [self testCase:ROUTE_PATH_STYLE];
    [self testCase:@"sheme://method/[key]vaule"];
    
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testCase:(NSString *)aCase {
    if ([[DCRouteEngine class] performSelector:@selector(verifyPathStyleWithString:)  withObject:aCase]) {
        NSLog(@"DCRouteEngine : Great ! %@ isverified",aCase);
    }else {
        NSLog(@"error %@",aCase);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
