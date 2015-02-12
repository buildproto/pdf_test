//
//  PDFTextStyle.m
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "PDFTextStyle.h"

@implementation PDFTextStyle

- (instancetype)initWithFont:(UIFont *)font
{
    self = [super init];
    if (self) {
        _font = [font copy];
    }
    
    return self;
}

@end
