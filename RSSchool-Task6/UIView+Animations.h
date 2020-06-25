//
//  UIView+Animations.h
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animations)

- (void)runShakeAnimationWithDuration:(CGFloat)duration
                               repeat:(BOOL)repeat;

- (void)runSpinAnimationWithDuration:(CGFloat)duration
                              repeat:(BOOL)repeat;

- (void)runPulseAnimation;

@end

NS_ASSUME_NONNULL_END
