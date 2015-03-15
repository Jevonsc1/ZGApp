//
//  ZGMyTopViewFrame.h
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZGUser.h"
@interface ZGMyTopViewFrame : NSObject

@property(nonatomic,strong)ZGUser* user;

@property(nonatomic,assign,readonly)CGFloat viewHeight;
@property(nonatomic,assign,readonly)CGRect notifBtnF;
@property(nonatomic,assign,readonly)CGRect settingBtnF;
@property(nonatomic,assign,readonly)CGRect searchBtnF;

@property(nonatomic,assign,readonly)CGRect nameLabelF;
@property(nonatomic,assign,readonly)CGRect iconViewF;

@property(nonatomic,assign,readonly)CGRect starViewF;

@property(nonatomic,assign,readonly)CGRect detailTextF;
@property(nonatomic,assign,readonly)CGRect tagsViewF;
@property(nonatomic,assign,readonly)CGRect sexViewF;
@property(nonatomic,assign,readonly)CGRect cameraViewF;
@property(nonatomic,assign,readonly)CGRect myColBtnF;
@property(nonatomic,assign,readonly)CGRect myFootstepBtnF;

@end
