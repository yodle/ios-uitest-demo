//
//  YODetailViewController.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import "YODetailViewController.h"
#import "PureLayout.h"

@interface YODetailViewController ()

@property (weak, nonatomic) YOItem* item;
@property (strong, nonatomic) UILabel* label;

@end

@implementation YODetailViewController

#pragma mark - NSObject

- (instancetype)initWithItem:(YOItem*)item
{
	if (self = [super init]) {
		_item = item;
	}
	return self;
}

#pragma mark - UIViewController

- (void)loadView
{
	self.view = [[UIView alloc] init];
	self.view.backgroundColor = [UIColor whiteColor];
	self.label = [[UILabel alloc] init];
	[self.view addSubview:self.label];
	[self.label autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.label.text = self.item.subtitle;
	self.label.font = [UIFont systemFontOfSize:32];
	self.label.textAlignment = NSTextAlignmentCenter;
}

@end
