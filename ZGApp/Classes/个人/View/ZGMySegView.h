//
//  ZGMySegView.h
//  ZGApp
//
//  Created by Jevons on 15/2/2.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGMySegView;
@protocol ZGMySegViewDelegate<NSObject>
-(void)ZGMySegView:(ZGMySegView*)view btn:(int)btnTag;
@end
@interface ZGMySegView : UIView
@property(nonatomic,weak)id<ZGMySegViewDelegate> delegate;
@end
