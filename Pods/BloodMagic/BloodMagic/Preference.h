//
// Created by AlexDenisov on 4/10/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#import <BloodMagic/BMPublicCoreDefnitions.h>
#import <BloodMagic/BMPreference.h>

#ifndef bm_preference
#define bm_preference
#endif

#ifndef preference
#define preference(property_name) register_module(BMPreference, property_name)
#endif

#ifndef BMPPreference
#define BMPPreference register_property(BMPreference)
#endif
