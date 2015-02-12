//
//  PDFTextLabel.m
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "PDFTextLabel.h"

// Styles
#import "PDFTextStyle.h"

@interface PDFTextLabel ()

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) PDFTextStyle *textStyle;

@end

@implementation PDFTextLabel

- (instancetype)initWithText:(NSString *)text style:(PDFTextStyle *)textStyle
{
    self = [super init];
    if (self) {
        _text = [text copy];
        _textStyle = textStyle;
                
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = textStyle.font;
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.text = text;
        _textLabel.numberOfLines = 0;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:_textLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = self.bounds;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return [self.textLabel sizeThatFits:size];
}

@end
