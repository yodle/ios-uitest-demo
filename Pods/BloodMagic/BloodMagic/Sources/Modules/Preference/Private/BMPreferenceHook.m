//
// Created by AlexDenisov on 4/10/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#import "BMPreferenceHook.h"
#import "BMProperty.h"

@implementation BMPreferenceHook

static inline NSUserDefaults *bm_preference_user_defaults(id sender)
{
    return [NSUserDefaults standardUserDefaults];
}

+ (void)accessorHook:(id *)value withProperty:(const BMProperty *)property sender:(id)sender
{
    NSUserDefaults *defaults = bm_preference_user_defaults(sender);
    *value = [defaults objectForKey:property.name];
}

+ (void)mutatorHook:(id *)value withProperty:(const BMProperty *)property sender:(id)sender
{
    NSUserDefaults *defaults = bm_preference_user_defaults(sender);
    [defaults setObject:*value forKey:property.name];
}

@end
