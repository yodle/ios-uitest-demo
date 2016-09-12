//
//  main.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/6/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOAppDelegate.h"
#import "YOTestingAppDelegate.h"

int main(int argc, char * argv[]) {
	@autoreleasepool {
		NSString* string = NSStringFromClass([YOAppDelegate class]);
		if (NSClassFromString(@"XCTest")) {
			string = NSStringFromClass([YOTestingAppDelegate class]);
		}
		return UIApplicationMain(argc, argv, nil, string);
	}
}
