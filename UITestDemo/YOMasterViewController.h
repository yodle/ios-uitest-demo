//
//  YOMasterViewController.h
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOItem.h"

@interface YOMasterViewController : UITableViewController

@property (copy, nonatomic) void(^onItemSelected)(YOItem*);

- (instancetype)initWithItems:(NSArray*)items;

@end
