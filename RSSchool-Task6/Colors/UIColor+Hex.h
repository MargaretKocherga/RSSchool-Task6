//
//  UIColor+UIColor_Hex.h
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (UIColor *)colorFromHexCode:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
