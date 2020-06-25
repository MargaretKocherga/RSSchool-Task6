//
//  CircleView.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()

@end

@implementation CircleView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = 35;
    }
    return self;
}

@end
