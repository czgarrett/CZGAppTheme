//
//  UIColor+CZGTheme.h
//  CZGAppThemes
//
//  Created by Christopher Garrett on 9/21/12.
//  Copyright (c) 2012 Christopher Garrett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CZGTheme)

// Color should be in the format
// {r,g,b,a}
+ (UIColor *) czgColorWithString: (NSString *) string;

@end
