//
//  UIImage+Cut.m
//  UIImageCTG
//
//  Created by Jevons on 2014/10/22.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "UIImage+Cut.h"

@implementation UIImage (Cut)


+(instancetype)cutWithPic:(UIImage *)pic border:(CGFloat)border color:(UIColor *)color
{
    UIImage* img=pic;
    
    
    
    CGFloat bigH=img.size.height+2*border;
    CGFloat bigW=img.size.width+2*border;
    CGSize size=CGSizeMake(bigW, bigH);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    
    
    [color set];
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGFloat centerX=bigW*0.5;
    CGFloat centerY=bigH*0.5;
    CGContextAddArc(ctx, centerX, centerY, bigW*0.5, 0, M_PI*2, 0);
    CGContextFillPath(ctx);
    
    
    //    CGFloat smallR=bigW-border;
    CGRect circleRect=CGRectMake(border, border, img.size.width, img.size.height);
    CGContextAddEllipseInRect(ctx, circleRect);
    
    //    CGContextAddArc(ctx, centerX, centerY, smallR, 0, M_PI*2, 0);
    //    CGContextFillPath(ctx);
    CGContextClip(ctx);
    
    //    [img drawInRect:CGRectMake(border, border, img.size.width, img.size.height)];
    [img drawInRect:circleRect];
    
    UIImage* view=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return view;
}
+(instancetype)cutCircleWithPic:(UIImage *)img
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, img.size.width, img.size.height));
    
    CGContextClip(ctx);
    [img drawAtPoint:CGPointMake(0, 0)];
    
    UIImage* view=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return view;

}
@end
