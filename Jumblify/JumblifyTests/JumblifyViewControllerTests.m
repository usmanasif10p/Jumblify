//
//  JumblifyViewControllerTests.m
//  Jumblify
//
//  Created by Andy Obusek on 10/13/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JumblifyViewController.h"

@interface JumblifyViewControllerTests : XCTestCase

@property (nonatomic) JumblifyViewController *vcToTest;

@end

@interface JumblifyViewController (Test)

- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *))completion;
- (NSInteger)sum:(NSInteger)a into:(NSInteger)b;
- (NSInteger)subtract:(NSInteger)a from:(NSInteger)b;
- (NSInteger)multiply:(NSInteger)a by:(NSInteger)b;
- (NSInteger)divide:(NSInteger)a by:(NSInteger)b;
- (NSDate *)getCurrentDate;

@end

@implementation JumblifyViewControllerTests

- (void)setUp {
    [super setUp];
    self.vcToTest = [[JumblifyViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReverseString {
    NSString *originalString = @"himynameisandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"ydnasiemanymih";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}

- (void)testPerformanceReverseString {
    NSString *originalString = @"himynameisandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString];
    }];
}

- (void)testDoSomethingThatTakesSomeTime {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testSum {
    NSInteger result = [self.vcToTest sum:16 into:3];
    NSInteger expectedResult = 19;
    XCTAssertEqual(result, expectedResult, @"The result did not match the expected result");
}

- (void)testSubtraction {
    NSInteger result = [self.vcToTest subtract:8 from:77];
    NSInteger expectedResult = 69;
    XCTAssertEqual(result, expectedResult, @"The result did not match the expected result");
}

- (void)testMultiplication {
    NSInteger result = [self.vcToTest multiply:48 by:5];
    NSInteger expectedResult = 240;
    XCTAssertEqual(result, expectedResult, @"The result did not match the expected result");
}

- (void)testDivision {
    NSInteger result = [self.vcToTest divide:69 by:2];
    NSInteger expectedResult = 34;
    XCTAssertEqual(result, expectedResult, @"The result did not match the expected result");
}

//- (void)testCurrentDate {
//    NSDate * currentDate = [self.vcToTest getCurrentDate];
//    NSDate * expectedDate = [NSDate date];
//    XCTAssertEqualObjects(currentDate, expectedDate, @"The current date did not match the expected date");
//}

@end
