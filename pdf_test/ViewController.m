//
//  ViewController.m
//  pdf_test
//
//  Created by Niels de Hoog on 12/02/15.
//  Copyright (c) 2015 Proto Venture Technology. All rights reserved.
//

#import "ViewController.h"

// Views
#import "PDFView.h"
#import "PDFTextStyle+MyStyles.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self renderPDF];
    
    NSURL *pdfURL = [NSURL fileURLWithPath:[self PDFPath]];
    NSURLRequest *url = [NSURLRequest requestWithURL:pdfURL];
    [self.webView loadRequest:url];
}

#pragma mark - PDF

- (void)renderPDF
{
    UIGraphicsBeginPDFContextToFile([self PDFPath], CGRectZero, nil);
    UIGraphicsBeginPDFPage();
    
    PDFView *view = [[PDFView alloc] initWithElements:[self PDFElements]];
    view.pageInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    view.frame = UIGraphicsGetPDFContextBounds();

    [view drawToPDFContext];
    
    UIGraphicsEndPDFContext();
}

- (NSString *)PDFPath
{
    NSString *fileName = @"test.pdf";
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

- (NSArray *)PDFElements
{
    NSMutableArray *elements = [NSMutableArray array];
   
    // create a bunch of content
    for (NSInteger i = 0, n = 10; i < n; i++) {
        PDFTextLabel *headerLabel = [[PDFTextLabel alloc] initWithText:[NSString stringWithFormat:@"Header %@", @(i + 1)] style:[PDFTextStyle headerTextStyle]];
        [elements addObject:headerLabel];
        
        PDFTextLabel *paragraphLabel = [[PDFTextLabel alloc] initWithText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin in nulla imperdiet, pharetra leo eget, fermentum nulla. Nunc cursus massa nunc, id lobortis neque imperdiet tincidunt. Phasellus porttitor ligula nec turpis lobortis egestas. Nulla sed nulla eu lacus faucibus faucibus." style:[PDFTextStyle paragraphTextStyle]];
        [elements addObject:paragraphLabel];
        
        PDFTextLabel *paragraphLabel2 = [[PDFTextLabel alloc] initWithText:@"Donec eget varius quam. Sed eu justo elit. Donec quis sodales ex. Nulla facilisi. Quisque eget gravida neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam bibendum nisl et ornare volutpat. Proin a iaculis lacus. Suspendisse pulvinar turpis dolor, id gravida ante vehicula non." style:[PDFTextStyle paragraphTextStyle]];
        [elements addObject:paragraphLabel2];
    }
    
    return [elements copy];
}

#pragma mark - UIWebView delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.webView.scrollView.contentOffset = CGPointMake(0, -(self.webView.scrollView.contentInset.top));
    });
    
}

@end
