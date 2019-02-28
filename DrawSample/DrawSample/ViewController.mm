//
//  ViewController.m
//  DrawSample
//
//  Created by KenUchida on 2019/02/22.
//  Copyright © 2019 KenUchida. All rights reserved.
//
/**
 https://tea-leaves.jp/home/ja/article/1375348709
 
https://qiita.com/y_matsuwitter/items/e93fffea4c9ba9e5d15a
 
 */
#import "ViewController.h"
#import <CoreText/CoreText.h>

#import <string>

//=================================
@interface ViewController ()

@end

@implementation ViewController{
    UIImage* alpaca;
}

/*
 //  https://developer.apple.com/library/archive/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/HandlingImages/Images.html    //  色指定
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    alpaca = [UIImage imageNamed:@"alpaca"];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f/24.0f
                                    target:self
                                   selector:@selector(onTimer:)
                                    userInfo:nil
                                    repeats:YES];
}

-(void)onTimer:(NSTimer*)timer{
    NSLog(@"onTimer");
    
    [self draw];
}

-(void)draw {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(500,500), NO, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));

    //  BackColor
    CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
//    CGContextFillRect(context, CGRectMake(0,0,500,500));

    //  画像
    static int x = 0;
    x++;
    [alpaca drawInRect:CGRectMake(x % 500,0,alpaca.size.width,alpaca.size.height)];

    //  FillRect
    CGContextSetRGBFillColor(context, 1.0,0.0,0.0,0.5);
    CGContextFillRect(context, CGRectMake(100,100,100,100));

    //  StrokeRect
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 0.5);
    CGContextStrokeRect(context, CGRectMake(200,100,100,100));
    
    //  円
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.1);
    CGContextFillEllipseInRect(context, CGRectMake(100,200,100,100));
    
    //  円の線
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 0.5);
    CGContextStrokeEllipseInRect(context, CGRectMake(200,200,100,100));
    
    //  Font
    CGContextSelectFont(context, "Arial Bold",16, kCGEncodingMacRoman);

    CGContextSetRGBFillColor(context,1.0, 0.0, 0.0, 1.0);
    CGContextSetRGBStrokeColor(context,0.5, 0.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetTextDrawingMode(context,kCGTextFill);
//        CGContextSetTextDrawingMode(context,kCGTextStroke);
//        CGContextSetTextDrawingMode(context,kCGTextFillStroke);
    std::string test = "test alpaca";
    CGContextShowTextAtPoint(context,50.0, 50.0, test.c_str(), test.size());

//        CGAffineTransform affine = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
//        CGContextSetTextMatrix(context, affine);
//        CGContextSetTextDrawingMode(context, kCGTextFillStroke);
//        CGContextSetTextDrawingMode(context, kCGTextFill);

    //  font2
    //  http://kassans.hatenablog.com/entry/2014/02/20/104911
    UIFont *font = [UIFont fontWithName:@"Verdana-Bold" size:20];
    UIColor *fontColor = [UIColor blueColor];
    NSString* text = @"I am a Alpaca.";

    [text drawAtPoint:CGPointMake(50,300) withAttributes:
        @{NSFontAttributeName:font, NSForegroundColorAttributeName:fontColor}];

    //  Show
    @autoreleasepool
    {
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        [self.imageView setImage:image];
    }
    
    //  End
    UIGraphicsEndImageContext();
}


- (IBAction)onButton:(id)sender {
}


@end
