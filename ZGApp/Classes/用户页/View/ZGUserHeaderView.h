//
//  ZGUserHeaderView.h
//  ZGApp
//
//  Created by T on 15/3/4.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 等同于个人页的topview，数据源一致
 */
#import "ZGHeaderFrame.h"

@interface ZGUserHeaderView : UIView
@property(nonatomic,strong)ZGHeaderFrame*  topF;
@property(nonatomic,assign)CGFloat viewHeight;
@end
