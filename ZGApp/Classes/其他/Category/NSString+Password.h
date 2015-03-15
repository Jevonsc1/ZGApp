//
//  NSString+Password.h
//  ZGApp
//
//  Created by Jevons on 15/3/12.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Password)
- (NSString *)myMD5;

/**
 *  32位MD5加密
 *
 *  @return 32位MD5加密结果
 */
- (NSString *)MD5;

/**
 *  SHA1加密
 *
 *  @return SHA1加密结果
 */
- (NSString *)SHA1;
@end
