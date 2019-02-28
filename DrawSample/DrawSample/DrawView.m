//
//  ViewController+DrawView.m
//  DrawSample
//
//  Created by KenUchida on 2019/02/23.
//  Copyright © 2019 KenUchida. All rights reserved.
//

#import "DrawView.h"

@interface DrawImage : UIView {
@private

}

//- (id)initWithImage:(UIImage *)image;

@end

@implementation DrawImage
/*
- (id)initWithImage:(UIImage *)image
{
    if ((self = [super init])) {
        image_ = image;
    }
    self.opaque = YES;
    
    return self;
}
*/
- (void)drawRect:(CGRect)rect
{
    NSLog(@"darwRect");
//    [image_ drawInRect:rect];
}

@end



@implementation DrawView{

}
#if 0
myImage = [[DrawImage alloc] initWithImage:alpaca];
myImage.frame = self.imageView.frame;
myImage.autoresizingMask =
UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
[self.imageView addSubview:myImage];
return;


//  reflesh
[myImage setNeedsDisplay];
#endif



@end
