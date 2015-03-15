//
//  ZGColBottomView.h
//  ZGApp
//
//  Created by Jevons on 15/2/6.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGColBottomView;
@protocol ZGColBottomViewDelegate<NSObject>
-(void)bottomViewWithSeleAll:(ZGColBottomView*)ZGColBottomView;
-(void)bottomViewWithDele:(ZGColBottomView*)ZGColBottomView;
@end
@interface ZGColBottomView : UIImageView
@property(nonatomic,weak)id<ZGColBottomViewDelegate> delegate;
@end
