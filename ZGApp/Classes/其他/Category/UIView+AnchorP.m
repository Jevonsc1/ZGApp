//
//  UIView+AnchorP.m
//  ZGApp
//
//  Created by Jevons on 15/2/11.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "UIView+AnchorP.h"

@implementation UIView (AnchorP)
+(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}

@end
