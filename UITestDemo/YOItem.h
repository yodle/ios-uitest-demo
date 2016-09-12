//
//  YOItem.h
//  UITestDemo
//
//  Created by Martin Rybak on 9/11/16.
//  Copyright © 2016 Yodle, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YOItem : NSObject

@property (copy, nonatomic) NSString* title;
@property (copy, nonatomic) NSString* subtitle;

+ (instancetype)itemWithTitle:(NSString*)title subtitle:(NSString*)subtitle;

@end
