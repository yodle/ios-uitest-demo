//
//  YOCoordinator.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/6/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import "YOCoordinator.h"
#import "YOMasterViewController.h"
#import "YODetailViewController.h"
#import "EXTScope.h"

@interface YOCoordinator ()

@property (weak, nonatomic) UIWindow* window;
@property (strong, nonatomic) UINavigationController* navigationController;

@end

@implementation YOCoordinator

#pragma mark - NSObject

- (instancetype)initWithWindow:(UIWindow *)window
{
	if (self = [super init]) {
		_window = window;
	}
	return self;
}

#pragma mark - Public

- (void)launch
{
	[self setRootViewController:[self masterViewController]];
}

#pragma mark - Private

- (YOMasterViewController*)masterViewController
{
	YOMasterViewController* masterViewController = [[YOMasterViewController alloc] initWithItems:[self items]];
	masterViewController.title = @"Items";
	@weakify(self);
	masterViewController.onItemSelected = ^(YOItem* item){
		@strongify(self);
		YODetailViewController* detailViewController = [self detailViewControllerWithItem:item];
		[self pushViewController:detailViewController];
	};
	return masterViewController;
}

- (YODetailViewController*)detailViewControllerWithItem:(YOItem*)item
{
	YODetailViewController* detailViewController = [[YODetailViewController alloc] initWithItem:item];
	detailViewController.navigationItem.title = item.title;
	return detailViewController;
}

- (NSArray*)items
{
	return @[
		[YOItem itemWithTitle:@"Aesop" subtitle:@"Rock"],
		[YOItem itemWithTitle:@"A$AP" subtitle:@"Rocky"],
		[YOItem itemWithTitle:@"Bobby" subtitle:@"Schmurda"],
		[YOItem itemWithTitle:@"Childish" subtitle:@"Gambino"],
		[YOItem itemWithTitle:@"Earl" subtitle:@"Sweatshirt"],
		[YOItem itemWithTitle:@"Gudda" subtitle:@"Gudda"],
		[YOItem itemWithTitle:@"Jay" subtitle:@"Electronica"],
		[YOItem itemWithTitle:@"Joey" subtitle:@"Bada$$"],
		[YOItem itemWithTitle:@"Immortal" subtitle:@"Technique"],
		[YOItem itemWithTitle:@"Isaiah" subtitle:@"Rashad"],
		[YOItem itemWithTitle:@"Kendrick" subtitle:@"Lamar"],
		[YOItem itemWithTitle:@"Lil" subtitle:@"Dicky"],
		[YOItem itemWithTitle:@"Mom's" subtitle:@"Spaghetti"],
		[YOItem itemWithTitle:@"No" subtitle:@"Wyld"],
		[YOItem itemWithTitle:@"Schoolboy" subtitle:@"Q"],
		[YOItem itemWithTitle:@"Scroobius" subtitle:@"Pip"],
		[YOItem itemWithTitle:@"Tech" subtitle:@"N9ne"]
	];
}

#pragma mark - Navigation

- (void)setRootViewController:(UIViewController*)viewController
{
	self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	self.window.rootViewController = self.navigationController;
}

- (void)pushViewController:(UIViewController*)viewController
{
	[[self topNavigationController] pushViewController:viewController animated:YES];
}

- (void)presentViewController:(UIViewController*)viewController
{
	[[self topNavigationController] presentViewController:viewController animated:YES completion:nil];
}

- (UINavigationController*)topNavigationController
{
	UINavigationController* output = self.navigationController;
	while (output.presentedViewController) {
		if ([output.presentedViewController isKindOfClass:[UINavigationController class]]) {
			output = (UINavigationController*)output.presentedViewController;
		}
	}
	return output;
}

@end
