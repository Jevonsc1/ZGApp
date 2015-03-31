//
//  ZGBaceInfoTextField.h
//  ZGApp
//
//  Created by Jevons on 15/2/18.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGBaceInfoTextField : UITextField
+(instancetype)initWithLeftTitle:(NSString*)leftTitle placeTitle:(NSString* )placeTitle;
@property(nonatomic,copy)NSString* leftTitle;
@property(nonatomic,copy)NSString* placeTitle;

@end
