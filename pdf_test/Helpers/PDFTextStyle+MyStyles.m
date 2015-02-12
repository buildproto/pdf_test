//
//  PDFTextStyle+MyStyles.m
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "PDFTextStyle+MyStyles.h"

@implementation PDFTextStyle (MyStyles)

+ (PDFTextStyle *)headerTextStyle
{
    return [[self alloc] initWithFont:[UIFont boldSystemFontOfSize:20]];
}

+ (PDFTextStyle *)paragraphTextStyle
{
    return [[self alloc] initWithFont:[UIFont systemFontOfSize:15]];
}

@end
