//
//  YOItem.m
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import "YOItem.h"

@implementation YOItem

+ (instancetype)itemWithTitle:(NSString*)title subtitle:(NSString*)subtitle
{
	YOItem* item = [[YOItem alloc] init];
	item.title = title;
	item.subtitle = subtitle;
	return item;
}

@end
