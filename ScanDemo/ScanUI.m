//
//  ScanUI.m
//  ScanDemo
//
//  Created by 王傲 on 16/8/30.
//  Copyright © 2016年 Hello. All rights reserved.
//

#import "ScanUI.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface ScanUI ()
{

}
@end

@implementation ScanUI

- (instancetype)initDefault
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
    {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setOpaque:NO];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setNeedsLayout];
        [self setNeedsDisplay];
    }
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)startScanAnimationWithCompletion:(void (^)(void))completion
{

}

- (void)stopScanAnimationWithCompletion:(void (^)(void))completion
{

}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    [self drawBackgroundColorInContext];

}

- (void)drawBackgroundColorInContext
{
    CGRect imgRect   = CGRectMake( 50 , self.bounds.size.height/2  - (self.bounds.size.width - 100)/2, self.bounds.size.width - 100, self.bounds.size.width - 100);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0. green:0. blue:0. alpha:0.5].CGColor);
    CGContextFillRect(ctx, self.bounds);
    CGContextAddRect(ctx, imgRect);
    CGContextClip(ctx);
    CGContextClearRect(ctx, imgRect);
    CGContextDrawImage(ctx, imgRect, [UIImage imageNamed:@"bounds"].CGImage);
    CGContextRestoreGState(ctx);
}

@end
