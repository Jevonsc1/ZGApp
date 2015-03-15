//
//  UIImage+Cut.h
//  UIImageCTG
//
//  Created by Jevons on 2014/10/22.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Cut)
+(instancetype)cutWithPic:(UIImage *)pic border:(CGFloat)border color:(UIColor *)color;
+(instancetype)cutCircleWithPic:(UIImage *)img;
@end
