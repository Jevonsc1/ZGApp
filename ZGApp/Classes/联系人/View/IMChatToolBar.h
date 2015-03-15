//
//  IMChatToolBar.h
//  ZGApp
//
//  Created by Jevons on 15/1/23.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IMChatToolBar;
@protocol IMChatToolBarDelegate<NSObject>
@optional
-(void)toobarComposeBtnClick:(IMChatToolBar*)toolbar;
@end
@interface IMChatToolBar : UIView
@property(nonatomic,copy)NSString* placeholder;
@property(nonatomic,weak)UITextView* typingTV;
@property(nonatomic,weak)id<IMChatToolBarDelegate> delegate;


@end
