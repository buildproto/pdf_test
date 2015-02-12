//
//  PDFView.h
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// Views
#import "PDFTextLabel.h"

// Helpers
#import "PDFTextStyle.h"

@interface PDFView : UIView

@property (nonatomic) UIEdgeInsets pageInsets;

- (instancetype)initWithElements:(NSArray *)elements;

- (void)drawToPDFContext;

@end
