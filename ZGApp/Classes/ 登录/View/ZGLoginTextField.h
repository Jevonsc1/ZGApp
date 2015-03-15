//
//  ZGLoginTextField.h
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGLoginTextField : UITextField
+(instancetype)initWithLeftImage:(UIImage* )image title:(NSString* )title;
@property(nonatomic,copy)NSString* titleStr;
@property(nonatomic,weak)UIImage* leftIcon;
@end
