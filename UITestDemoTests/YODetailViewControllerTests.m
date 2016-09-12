//
//  YODetailViewControllerTests.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YODetailViewController.h"
#import "YOItem.h"
#import "KIF.h"

@interface YODetailViewControllerTests : XCTestCase

@end

@implementation YODetailViewControllerTests

- (void)testShowsItemSubtitle
{
	YOItem* item = [YOItem itemWithTitle:@"Foo" subtitle:@"Bar"];
	YODetailViewController* detailViewController = [[YODetailViewController alloc] initWithItem:item];
	[[[UIApplication sharedApplication] keyWindow] setRootViewController:detailViewController];
	[tester waitForViewWithAccessibilityLabel:item.subtitle];
}

@end
