//
//  ZGNotifiationSegView.h
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentBtn.h"
@class ZGNotifiationSegView;
@protocol  ZGNotifiationSegViewDelegate<NSObject>

@optional
-(void)segmentView:(ZGNotifiationSegView*)segmentView button:(int)tag;

@end

@interface ZGNotifiationSegView : UIImageView
@property(nonatomic,weak)id<ZGNotifiationSegViewDelegate> delegate;
@property(nonatomic,weak)SegmentBtn* curBtn;


@end
