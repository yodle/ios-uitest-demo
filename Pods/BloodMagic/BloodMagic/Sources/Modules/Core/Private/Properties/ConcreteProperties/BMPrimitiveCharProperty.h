//
// Created by Alex Denisov on 20.07.13.
// Copyright (c) 2013 railsware. All rights reserved.
//

#pragma once

#import "BMInternalPropertyTemplate.h"

class BMPrimitiveCharProperty : public BMInternalPropertyTemplate<char>
{
public:
    char unbox(id value) override;
    id box(char value) override;
};
