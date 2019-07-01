//
//  URLQueryBuilderTests.m
//  URLQueryBuilderTests
//
//  Created by MakeHui on 1/7/2019.
//  Copyright © 2019 MakeHui. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <URLQueryBuilder/URLQueryBuilder.h>

@interface URLQueryBuilderTests : XCTestCase

@end

@implementation URLQueryBuilderTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    NSString *URLString = @"https://www.google.com/?s=URLQueryBuilder";
    NSURL *URL = [NSURL URLWithString:URLString];
    
    NSString *nilURLString = nil;
    NSString *nilURL = nil;
    
    NSDictionary *query = @{ @"foo": @"bar" };
    
    XCTAssertTrue([[[URLString ars_queryElements:query] ars_queryDictionary] count] == 2, @"error");
    XCTAssertTrue([[[URL ars_queryElements:query] ars_queryDictionary] count] == 2, @"error");
    
    XCTAssertTrue([[[nilURLString ars_queryElements:query] ars_queryDictionary] count] == 0, @"error");
    XCTAssertTrue([[[nilURL ars_queryElements:query] ars_queryDictionary] count] == 0, @"error");
}

@end
