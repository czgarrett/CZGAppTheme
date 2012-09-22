//
//  CZGTheme.h
//  CZGAppThemes
//
//  Created by Christopher Garrett on 9/21/12.
//  Copyright (c) 2012 Christopher Garrett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGTheme : NSObject

+ (void) use: (NSString *) themeName;
+ (CZGTheme *) themeNamed: (NSString *) themeName;
- (void) apply;

@property (nonatomic, copy) NSString *themeName;
@property (nonatomic, retain) NSMutableDictionary *themeProperties;

@end
