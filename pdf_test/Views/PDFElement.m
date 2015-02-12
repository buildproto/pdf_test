//
//  PDFElement.m
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "PDFElement.h"

@implementation PDFElement

- (instancetype)init
{
    self = [super init];
    if (self) {
        _marginTop = 0;
        _marginBottom = 20;
    }
    return self;
}

@end
