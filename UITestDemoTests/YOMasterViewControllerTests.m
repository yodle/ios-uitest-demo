//
//  YOMasterViewControllerTests.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YOMasterViewController.h"
#import "YOItem.h"
#import "KIF.h"

@interface YOMasterViewControllerTests : XCTestCase

@end

@implementation YOMasterViewControllerTests

#pragma mark - Item Name

- (void)testItemNameVisible
{
	YOItem* item = [YOItem itemWithTitle:@"Foo" subtitle:@"Bar"];
	YOMasterViewController* masterViewController = [[YOMasterViewController alloc] initWithItems:@[ item ]];
	[[[UIApplication sharedApplication] keyWindow] setRootViewController:masterViewController];
	[tester waitForViewWithAccessibilityLabel:item.title];
}

#pragma mark - Empty View

- (void)testEmptyViewVisibleIfNoItems
{
	YOMasterViewController* masterViewController = [[YOMasterViewController alloc] initWithItems:@[]];
	[[[UIApplication sharedApplication] keyWindow] setRootViewController:masterViewController];
	[tester waitForViewWithAccessibilityLabel:@"No Items"];
}

- (void)testEmptyViewHiddenIfItems
{
	YOItem* item = [YOItem itemWithTitle:@"Foo" subtitle:@"Bar"];
	YOMasterViewController* masterViewController = [[YOMasterViewController alloc] initWithItems:@[ item ]];
	[[[UIApplication sharedApplication] keyWindow] setRootViewController:masterViewController];
	[tester waitForAbsenceOfViewWithAccessibilityLabel:@"No Items"];
}

#pragma mark - OnItemSelected

- (void)testSelectingItemInvokesOnItemSelected
{
	YOItem* item = [YOItem itemWithTitle:@"Foo" subtitle:@"Bar"];
	YOMasterViewController* masterViewController = [[YOMasterViewController alloc] initWithItems:@[ item ]];
	
	XCTestExpectation* expectation = [self expectationWithDescription:NSStringFromSelector(_cmd)];
	masterViewController.onItemSelected = ^(YOItem* selectedItem) {
		XCTAssertEqualObjects(selectedItem, item);
		[expectation fulfill];
	};
	
	[[[UIApplication sharedApplication] keyWindow] setRootViewController:masterViewController];
	[tester tapViewWithAccessibilityLabel:item.title];
	[self waitForExpectationsWithTimeout:1.0 handler:nil];
}

@end
