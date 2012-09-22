//
//  CZGTheme.m
//  CZGAppThemes
//
//  Created by Christopher Garrett on 9/21/12.
//  Copyright (c) 2012 Christopher Garrett. All rights reserved.
//

#import "CZGTheme.h"
#import "UIColor+CZGTheme.h"

@implementation CZGTheme

+ (void) use: (NSString *) themeName {
    CZGTheme *theme = [CZGTheme themeNamed: (themeName)];
    [theme apply];
}

+ (CZGTheme *) themeNamed:(NSString *)themeName {
    CZGTheme *result = [[[self class] alloc] initWithThemeName: themeName];
    return result;
}

- (id) initWithThemeName: (NSString *) themeName {
    self = [super init];
    if (self) {
        self.themeName = themeName;
        NSString *themePath = [[NSBundle mainBundle] pathForResource: themeName ofType: @"plist"];
        self.themeProperties = [NSMutableDictionary dictionaryWithContentsOfFile: themePath];
    }
    return self;
}

- (void) apply {
    [self applyBarButtonItemTheme];
    [self applyButtonTheme];
    [self applyNavigationBarTheme];
    [self applyToolbarTheme];
}

- (void) applyBarButtonItemTheme {
    NSString *root = [self.themeName stringByAppendingString: @"_UIBarButtonItem"];
    NSDictionary *properties = self.themeProperties[@"UIBarButtonItem"];
    UIBarButtonItem *appearance = (UIBarButtonItem *) [UIBarButtonItem appearance];
    NSDictionary *states = @{
        @(UIControlStateNormal) : @"UIControlStateNormal",
        @(UIControlStateDisabled):  @"UIControlStateDisabled",
        @(UIControlStateHighlighted):  @"UIControlStateHighlighted",
        @(UIControlStateSelected): @"UIControlStateSelected"
    };
    for(NSNumber *key in states) {
        UIControlState state = [key intValue];
        NSString *stateName = [states objectForKey: key];
        UIImage *background = [UIImage imageNamed: [root stringByAppendingFormat: @"_BackgroundImage_%@", stateName]];
        if (background) {
            UIEdgeInsets capInsets = UIEdgeInsetsFromString(properties[@"backgroundImage"][stateName][@"capInsets"]);
            background = [background resizableImageWithCapInsets: capInsets resizingMode: UIImageResizingModeStretch];
            [appearance setBackgroundImage: background forState: state barMetrics: UIBarMetricsDefault];
        }
    }
}

- (void) applyButtonTheme {
    NSString *root = [self.themeName stringByAppendingString: @"_UIButton"];
    NSDictionary *properties = self.themeProperties[@"UIButton"];
    UIButton *appearance = (UIButton *) [UIButton appearance];
    NSDictionary *states = @{
        @(UIControlStateNormal) : @"UIControlStateNormal",
        @(UIControlStateDisabled):  @"UIControlStateDisabled",
        @(UIControlStateHighlighted):  @"UIControlStateHighlighted",
        @(UIControlStateSelected): @"UIControlStateSelected"
    };
    for(NSNumber *key in states) {
        UIControlState state = [key intValue];
        NSString *stateName = [states objectForKey: key];
        UIImage *background = [UIImage imageNamed: [root stringByAppendingFormat: @"_BackgroundImage_%@", stateName]];
        if (background) {
            UIEdgeInsets capInsets = UIEdgeInsetsFromString(properties[@"backgroundImage"][stateName][@"capInsets"]);
            background = [background resizableImageWithCapInsets: capInsets resizingMode: UIImageResizingModeStretch];
            [appearance setBackgroundImage: background forState: state];
        }
        UIColor *titleColor = [UIColor czgColorWithString: properties[@"titleColor"][stateName]];
        if (titleColor) {
            [appearance setTitleColor: titleColor forState: state];
        }
        UIColor *shadowColor = [UIColor czgColorWithString: properties[@"titleShadowColor"][stateName]];
        if (shadowColor) {
            [appearance setTitleShadowColor: shadowColor forState: state];
        }
    }
}

- (void) applyNavigationBarTheme {
    NSString *root = [self.themeName stringByAppendingString: @"_UINavigationBar"];
    NSDictionary *properties = self.themeProperties[@"UINavigationBar"];
    UINavigationBar *appearance = (UINavigationBar *) [UINavigationBar appearance];
    NSDictionary *states = @{
    @(UIBarMetricsDefault) : @"UIBarMetricsDefault",
    @(UIBarMetricsLandscapePhone):  @"UIBarMetricsLandscapePhone"
    };
    
    for(NSNumber *key in states) {
        UIBarMetrics metrics = [key intValue];
        NSString *stateName = [states objectForKey: key];
        UIImage *background = [UIImage imageNamed: [root stringByAppendingFormat: @"_BackgroundImage_%@", stateName]];
        if (background) {
            UIEdgeInsets capInsets = UIEdgeInsetsFromString(properties[@"backgroundImage"][stateName][@"capInsets"]);
            background = [background resizableImageWithCapInsets: capInsets resizingMode: UIImageResizingModeStretch];
            [appearance setBackgroundImage: background forBarMetrics: metrics];
            [appearance setBackgroundColor: [UIColor clearColor]];
        }
    }
}



- (void) applyToolbarTheme {
    NSString *root = [self.themeName stringByAppendingString: @"_UIToolbar"];
    NSDictionary *properties = self.themeProperties[@"UIToolbar"];
    UIToolbar *appearance = (UIToolbar *) [UIToolbar appearance];
    NSDictionary *states = @{
    @(UIBarMetricsDefault) : @"UIBarMetricsDefault",
    @(UIBarMetricsLandscapePhone):  @"UIBarMetricsLandscapePhone"
    };
    for(NSNumber *key in states) {
        UIBarMetrics metrics = [key intValue];
        NSString *stateName = [states objectForKey: key];
        UIImage *background = [UIImage imageNamed: [root stringByAppendingFormat: @"_BackgroundImage_%@", stateName]];
        if (background) {
            UIEdgeInsets capInsets = UIEdgeInsetsFromString(properties[@"backgroundImage"][stateName][@"capInsets"]);
            background = [background resizableImageWithCapInsets: capInsets resizingMode: UIImageResizingModeStretch];
            [appearance setBackgroundImage: background forToolbarPosition: UIToolbarPositionAny barMetrics: metrics];
            [appearance setBackgroundColor: [UIColor clearColor]];
        }
    }
}


@end
