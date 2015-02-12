//
//  PDFView.m
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "PDFView.h"

// Helpers
#import "UIView+HierarchicalDrawing.h"

@interface PDFView ()

@property (nonatomic, copy) NSArray *elements;

@end

@implementation PDFView

- (instancetype)initWithElements:(NSArray *)elements
{
    self = [super init];
    if (self) {
        _elements = [elements copy];
        
        for (UIView *element in _elements) {
            [self addSubview:element];
        }
    }
    return self;
}

- (void)layoutWithFirstElementIndex:(NSInteger)firstElementIndex
{
    CGPoint offset = CGPointMake(self.pageInsets.left, self.pageInsets.top);
    
    NSInteger i = 0;
    for (PDFElement *element in self.elements) {
        
        if (i < firstElementIndex) {
            i++;
            continue;
        }
        
        offset.y += element.marginTop;
        
        CGRect frame = element.frame;
        frame.origin = offset;
        frame.size = [element sizeThatFits:CGSizeMake(CGRectGetWidth(self.bounds) - self.pageInsets.left - self.pageInsets.right, FLT_MAX)];
        element.frame = frame;
        
        offset.y += CGRectGetHeight(element.bounds) + element.marginBottom;
        
        i++;
    }
}

- (void)drawToPDFContext
{
    [self layoutWithFirstElementIndex:0];
    
    for (PDFElement *element in self.elements) {
        CGFloat yOffset = CGRectGetMaxY(element.frame);
        if (yOffset > (CGRectGetMaxY(self.bounds) - self.pageInsets.bottom)) {
            // create new page if we exceed bounds
            UIGraphicsBeginPDFPage();
            [self layoutWithFirstElementIndex:[self.elements indexOfObject:element]];
        }
        
        [element drawHierarchy];
    }
}

@end
