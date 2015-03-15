//
//  ZGSegementView.h
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGSegementView;
@protocol ZGSegementViewDelegate<NSObject>
-(void)segView:(ZGSegementView*)view btnTag:(int)btntag;
@end

@interface ZGSegementView : UIView
@property(nonatomic,weak)id<ZGSegementViewDelegate> delegate;
@end
