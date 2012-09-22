//
//  UIColor+CZGTheme.m
//  CZGAppThemes
//
//  Created by Christopher Garrett on 9/21/12.
//  Copyright (c) 2012 Christopher Garrett. All rights reserved.
//

#import "UIColor+CZGTheme.h"

@implementation UIColor (CZGTheme)

+ (UIColor *) czgColorWithString: (NSString *) string {
    if (!string || [string length] == 0) return nil;
    NSString *withoutBraces = [string substringWithRange: NSMakeRange(1, [string length]-2)];
    NSArray *colors = [withoutBraces componentsSeparatedByString: @","];
    CGFloat components[4] = {1.0,1.0,1.0,1.0};
    for (int i=0; i<4; i++) {
        NSAssert([colors count] > i, @"Improper format");
        components[i] = [[colors objectAtIndex: i] floatValue];
    }
    return [UIColor colorWithRed: components[0] green: components[1] blue: components[2] alpha: components[3]];
}

@end
