//
//  BHDConverter.m
//  ToolsClass
//
//  Created by 张亮杰 on 2017/7/17.
//  Copyright © 2017年 ZLJ. All rights reserved.
//

#import "BHDConverter.h"

@implementation BHDConverter

+ (NSInteger)toDecimalFromHex:(NSString *)hexStr isComplement:(BOOL)isComplement {
    if (isComplement == YES) {
        NSString *binaryStr = [BHDConverter toBinaryFromHex:hexStr];
        return [BHDConverter toDecimalFromBinary:binaryStr isComplement:YES];
    } else {
        return strtol([hexStr UTF8String], 0, 16);
    }
}

+ (NSInteger)toDecimalFromBinary:(NSString *)binaryStr isComplement:(BOOL)isComplement {
    if (isComplement == YES) {
        if ([[binaryStr substringWithRange:NSMakeRange(0, 1)] intValue] == 1) {
            long result = strtol([binaryStr UTF8String], 0, 16);
            result = result - 1;
            NSString *complementBinaryString = [BHDConverter toBinaryFromDecimal:result];
            NSString *originalBinaryString = @"";
            for (int i = 0; i < complementBinaryString.length; i ++) {
                NSString *tmp = [complementBinaryString substringWithRange:NSMakeRange(i, 1)];
                if ([tmp isEqualToString:@"1"]) {
                    tmp = @"0";
                } else {
                    tmp = @"1";
                }
                originalBinaryString = [NSString stringWithFormat:@"%@%@", originalBinaryString, tmp];
            }
            NSInteger fainallyResult = strtol([originalBinaryString UTF8String], 0, 2);
            return -fainallyResult;
        } else {
            return strtol([binaryStr UTF8String], 0, 16);
        }
    } else {
        return strtol([binaryStr UTF8String], 0, 2);
    }
}

+ (NSString *)toBinaryFromHex:(NSString *)hexStr {
    NSString *strResult = @"";
    NSDictionary *dictBinToHax = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"0000",@"0",
                                  @"0001",@"1",
                                  @"0010",@"2",
                                  @"0011",@"3",
                                  
                                  @"0100",@"4",
                                  @"0101",@"5",
                                  @"0110",@"6",
                                  @"0111",@"7",
                                  
                                  @"1000",@"8",
                                  @"1001",@"9",
                                  @"1010",@"A",
                                  @"1011",@"B",
                                  
                                  @"1100",@"C",
                                  @"1101",@"D",
                                  @"1110",@"E",
                                  @"1111",@"F",
                                  
                                  @"1010",@"a",
                                  @"1011",@"b",
                                  
                                  @"1100",@"c",
                                  @"1101",@"d",
                                  @"1110",@"e",
                                  @"1111",@"f",
                                  nil];
    
    for (int i = 0;i < [hexStr length]; i+=1) {
        NSString *strBinaryKey = [hexStr substringWithRange: NSMakeRange(i, 1)];
        strResult = [NSString stringWithFormat:@"%@%@",strResult,[dictBinToHax valueForKey:strBinaryKey]];
    }
    return  strResult;
}

+ (NSString *)toBinaryFromDecimal:(NSInteger)decimal {
    NSInteger num = decimal;
    NSInteger remainder = 0;      //余数
    NSInteger divisor = 0;        //除数
    NSString * prepare = @"";
    
    while (true) {
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%ld",remainder];
        
        if (divisor == 0) {
            break;
        }
    }
    
    NSString * result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i --) {
        result = [result stringByAppendingFormat:@"%@",
                  [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    return result;
}

+ (NSString *)toHexFromDecimal:(NSInteger)decimal {
    NSString *nLetterValue;
    NSString *str =@"";
    uint16_t ttmpig;
    if (decimal < 16) {//只有一位数 返回 @“0X”
        switch (decimal) {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%ld",(long)decimal];
        }
        str = [str stringByAppendingString:@"0"];
        str = [str stringByAppendingString:nLetterValue];
    } else {
        for (int i = 0; i<9; i++) {
            ttmpig=decimal%16;
            decimal=decimal/16;
            switch (ttmpig) {
                case 10:
                    nLetterValue =@"A";break;
                case 11:
                    nLetterValue =@"B";break;
                case 12:
                    nLetterValue =@"C";break;
                case 13:
                    nLetterValue =@"D";break;
                case 14:
                    nLetterValue =@"E";break;
                case 15:
                    nLetterValue =@"F";break;
                default:
                    nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
            }
            str = [nLetterValue stringByAppendingString:str];
            if (decimal == 0) {
                break;
            }
        }
    }
    return str;
}

+ (NSString *)toHexFromBinary:(NSString *)binaryStr {
    NSMutableString *convertingString = [[NSMutableString alloc] init];
    for (int x = 0; x < ([binaryStr length]/4); x++) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        
        NSString *A = [NSString stringWithFormat:@"%c", [binaryStr characterAtIndex:(x*4+0)]];
        NSString *B = [NSString stringWithFormat:@"%c", [binaryStr characterAtIndex:(x*4+1)]];
        NSString *C = [NSString stringWithFormat:@"%c", [binaryStr characterAtIndex:(x*4+2)]];
        NSString *D = [NSString stringWithFormat:@"%c", [binaryStr characterAtIndex:(x*4+3)]];
        
        
        if ([A isEqualToString:@"1"]) { a = 8;}
        
        if ([B isEqualToString:@"1"]) { b = 4;}
        
        if ([C isEqualToString:@"1"]) { c = 2;}
        
        if ([D isEqualToString:@"1"]) { d = 1;}
        
        int total = a + b + c + d;
        
        if (total < 10) { [convertingString appendFormat:@"%i",total]; }
        else if (total == 10) { [convertingString appendString:@"a"]; }
        else if (total == 11) { [convertingString appendString:@"b"]; }
        else if (total == 12) { [convertingString appendString:@"c"]; }
        else if (total == 13) { [convertingString appendString:@"d"]; }
        else if (total == 14) { [convertingString appendString:@"e"]; }
        else if (total == 15) { [convertingString appendString:@"f"]; }
        
    }
    NSString *convertedHexString = convertingString;
    return convertedHexString;
}




@end
