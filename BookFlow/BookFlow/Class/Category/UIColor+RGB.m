//
//  UIColor+RGB.m
//  BookFlow
//
//  Created by chenlong on 2017/5/26.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor *)getColorByRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [UIColor colorWithRed:red / 255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
