//
//  UIView+Animations.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "UIView+Animations.h"

@implementation UIView (Animations)

- (void)runSpinAnimationWithDuration:(CGFloat)duration
                              repeat:(BOOL)repeat {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2.0 * duration);
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat ? HUGE_VALF : 0;
    rotationAnimation.removedOnCompletion = NO;

    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)runShakeAnimationWithDuration:(CGFloat)duration
                               repeat:(BOOL)repeat {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.duration = duration;
    animation.repeatCount = repeat ? HUGE_VALF : 0;
    animation.autoreverses = YES;
    animation.fromValue = @(25);
    animation.toValue = @(45);
    animation.removedOnCompletion = NO;

    [self.layer addAnimation:animation forKey:@"position"];
}

- (void)runPulseAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fromValue = @(0.9);
    animation.toValue = @(1.1);
    animation.removedOnCompletion = NO;

    [self.layer addAnimation:animation forKey:@"pulse"];
}

@end
