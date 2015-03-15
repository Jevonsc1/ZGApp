//
//  ZGMyTopView.h
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGMyTopViewFrame.h"
@class ZGMyTopView;
@protocol ZGMyTopViewDelegate<NSObject>

@optional
-(void)topViewWithColBtn:(ZGMyTopView*)topView;
-(void)topViewWithFootStepBtn:(ZGMyTopView*)topView;
-(void)topViewWithCameraBtn:(ZGMyTopView*)topView btn:(NSInteger)btnNum;

@end
@interface ZGMyTopView : UIView

@property(nonatomic,strong)ZGMyTopViewFrame* topF;
@property(nonatomic,weak)UIButton* myColBtn;
@property(nonatomic,weak)UIButton* myFootstepBtn;
@property(nonatomic,weak)id<ZGMyTopViewDelegate> delegate;
@end
