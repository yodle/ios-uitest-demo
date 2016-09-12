//
//  AppDelegate.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/6/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import "YOAppDelegate.h"
#import "YOCoordinator.h"

@interface YOAppDelegate ()

@property (strong, nonatomic) YOCoordinator* coordinator;

@end

@implementation YOAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	[self.window makeKeyAndVisible];
	self.coordinator = [[YOCoordinator alloc] initWithWindow:self.window];
	[self.coordinator launch];
	return YES;
}

@end
