//
//  UIImage+Rectcut.m
//  ZGApp
//
//  Created by Jevons on 15/1/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "UIImage+Rectcut.h"

@implementation UIImage (Rectcut)
+(instancetype)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return reSizeImage;
    
}

@end
