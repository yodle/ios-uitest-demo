//
//  YOMasterViewController.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import "YOMasterViewController.h"

@interface YOMasterViewController ()

@property (copy, nonatomic) NSArray* items;

@end

@implementation YOMasterViewController

#pragma mark - NSObject

- (instancetype)initWithItems:(NSArray*)items
{
	if (self = [super init]) {
		_items = items;
	}
	return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell description]];
	if (!self.items.count) {
		self.tableView.backgroundView = [self emptyLabel];
	}
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell description] forIndexPath:indexPath];
	YOItem* item = self.items[indexPath.row];
	cell.textLabel.text = item.title;
	cell.detailTextLabel.text = item.subtitle;
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	YOItem* item = self.items[indexPath.row];
	if (self.onItemSelected) {
		self.onItemSelected(item);
	}
}

#pragma mark - Private

- (UILabel*)emptyLabel
{
	UILabel* label = [[UILabel alloc] init];
	label.text = @"No Items";
	label.textAlignment = NSTextAlignmentCenter;
	return label;
}

@end
