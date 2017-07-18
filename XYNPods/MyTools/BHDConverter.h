//
//  BHDConverter.h
//  ToolsClass
//
//  Created by 张亮杰 on 2017/7/17.
//  Copyright © 2017年 ZLJ. All rights reserved.
//

// 主要是 二进制 十六进制 十进制 相互转换
#import <Foundation/Foundation.h>

@interface BHDConverter : NSObject

/**
 将16进制转换成十进制的数字
 
 @param hexStr 只能转换单个 不包含 0x
 @return 十进制
 */
+ (NSInteger)toDecimalFromHex:(NSString *)hexStr isComplement:(BOOL)isComplement;

/**
 将二进制转换成十进制的数字
 
 @param binaryStr 只能转换单个
 @return 十进制
 */
+ (NSInteger)toDecimalFromBinary:(NSString *)binaryStr isComplement:(BOOL)isComplement;


/**
 将十六进制转换成二进制

 @param hexStr 不包含 0x
 @return 二进制字符串
 */
+ (NSString *)toBinaryFromHex:(NSString *)hexStr;


/**
 将十进制转换成二进制

 @param decimal 十进制数
 @return 二进制字符串
 */
+ (NSString *)toBinaryFromDecimal:(NSInteger)decimal;


/**
 将十进制转换成十六进制

 @param decimal 十进制
 @return 十六进制字符串
 */
+ (NSString *)toHexFromDecimal:(NSInteger)decimal;

/**
 将二进制转换成十六进制

 @param binaryStr 二进制
 @return 十六进制
 */
+ (NSString *)toHexFromBinary:(NSString *)binaryStr;


@end
