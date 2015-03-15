//
//  ZGNavigationBackView.m
//  ZGApp
//
//  Created by Jevons on 15/1/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGNavigationBackView.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+Rectcut.h"
#import "UIImageView+WebCache.h"
@interface ZGNavigationBackView ()

@end
@implementation ZGNavigationBackView

//-(void)setImg:(UIImage *)img
//{
//    _img=img;
////    self.backgroundColor=[UIColor redColor];
////    self.backgroundColor=[UIColor colorWithPatternImage:[img applyBlurWithRadius:BlurWithRadius tintColor:[UIColor clearColor] saturationDeltaFactor:2.0f maskImage:nil]];
//
//}
-(void)setBook:(ZGBook *)book
{
    _book=book;
    [self setImageWithURL:[NSURL URLWithString:book.images.medium]];
    self.image=[self.image applyBlurWithRadius:BlurWithRadius tintColor:nil saturationDeltaFactor:2.0 maskImage:nil];
}
@end
