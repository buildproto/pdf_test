//
//  PDFTextLabel.h
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "PDFElement.h"

@class PDFTextStyle;

@interface PDFTextLabel : PDFElement

- (instancetype)initWithText:(NSString *)text style:(PDFTextStyle *)textStyle;

@end
