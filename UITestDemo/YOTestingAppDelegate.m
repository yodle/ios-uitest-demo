//
//  YOTestingAppDelegate.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/6/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import "YOTestingAppDelegate.h"

@implementation YOTestingAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.window makeKeyAndVisible];
	self.window.rootViewController = [[UIViewController alloc] init];
	return YES;
}

@end
