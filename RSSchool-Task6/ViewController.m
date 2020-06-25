//
//  ViewController.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "ViewController.h"
#import "SquareView.h"
#import "CircleView.h"
#import "TriangleView.h"
#import "UIColor+Hex.h"
#import "TabBarController.h"
#import "UIView+Animations.h"

static NSString *const triangleColorHex = @"34C1A1";
static NSString *const squareColorHex = @"29C2D1";
static NSString *const circleColorHex = @"EE686A";

@interface ViewController ()

@property (strong, nonatomic) IBOutlet SquareView *squareView;
@property (strong, nonatomic) IBOutlet CircleView *circleView;
@property (strong, nonatomic) IBOutlet TriangleView *triangleView;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    [self setupColors];
    [self addAnimations];
    self.startButton.layer.cornerRadius = 27.5;
}

- (void)setupColors {
    self.squareView.color = [UIColor colorFromHexCode:squareColorHex];
    self.circleView.backgroundColor = [UIColor colorFromHexCode:circleColorHex];
    self.triangleView.color = [UIColor colorFromHexCode:triangleColorHex];
}

- (void)addAnimations {
    [self.squareView runShakeAnimationWithDuration:0.5 repeat:YES];
    [self.triangleView runSpinAnimationWithDuration:1 repeat:YES];
    [self.circleView runPulseAnimation];
}

- (IBAction)startButtonPressed:(UIButton *)sender {
    TabBarController *tabBarController = [TabBarController new];
    tabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

@end
