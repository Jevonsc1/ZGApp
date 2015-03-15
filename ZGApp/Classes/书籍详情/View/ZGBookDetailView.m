//
//  ZGBookDetailView.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailView.h"
#import "ZGBookDetailTopView.h"
#import "BookDetailBottomView.h"
@interface ZGBookDetailView()
@property(nonatomic,weak)ZGBookDetailTopView* topView;
@property(nonatomic,weak)BookDetailBottomView* bottomView;

@end

@implementation ZGBookDetailView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor redColor];
            }
    return self;

}


@end
