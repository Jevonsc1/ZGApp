//
//  ZGNofCellFrame.h
//  ZGApp
//
//  Created by Jevons on 15/1/29.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZGNofCellData.h"

@interface ZGNofCellFrame : NSObject
@property(nonatomic,strong)ZGNofCellData* celldata;

@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect iconF;
@property(nonatomic,assign)CGPoint rightBtnCenter;
@property(nonatomic,assign)CGSize rightBtnSize;
@property(nonatomic,assign)CGRect nameF;
@property(nonatomic,assign)CGRect newBtnF;
@property(nonatomic,assign)CGRect detailTextF;



@end
