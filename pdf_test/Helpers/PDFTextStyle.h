//
//  PDFTextStyle.h
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PDFTextStyle : NSObject

@property (nonatomic, copy) UIFont *font;

- (instancetype)initWithFont:(UIFont *)font;

@end
