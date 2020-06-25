
#import "ThirdTabViewController.h"
#import "CircleView.h"
#import "SquareView.h"
#import "TriangleView.h"
#import "UIColor+Hex.h"
#import "UIView+Animations.h"

static NSString *const triangleColorHex = @"34C1A1";
static NSString *const squareColorHex = @"29C2D1";
static NSString *const circleColorHex = @"EE686A";

@interface ThirdTabViewController ()

@property (strong, nonatomic) IBOutlet UILabel *iPhoneNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *iPhoneModelLabel;
@property (strong, nonatomic) IBOutlet UILabel *iOSVersionLabel;
@property (strong, nonatomic) IBOutlet CircleView *circleView;
@property (strong, nonatomic) IBOutlet SquareView *squareView;
@property (strong, nonatomic) IBOutlet TriangleView *triangleView;
@property (strong, nonatomic) IBOutlet UIButton *openGitHubButton;
@property (strong, nonatomic) IBOutlet UIButton *goToStartButton;

@end

@implementation ThirdTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"RSSchool Task 6";
    self.iPhoneNameLabel.text = [[UIDevice currentDevice] name];
    self.iPhoneModelLabel.text = [[UIDevice currentDevice] model];
    self.iOSVersionLabel.text = [NSString stringWithFormat:@"iOS %@", [[UIDevice currentDevice] systemVersion]];

    [self setupColors];
    [self addAnimations];
    for (UIButton *button in @[self.openGitHubButton, self.goToStartButton]) {
        button.layer.cornerRadius = 27.5;
    }
}

- (void)setupColors {
    self.squareView.color = [UIColor colorFromHexCode:squareColorHex];
    self.circleView.backgroundColor = [UIColor colorFromHexCode:circleColorHex];
    self.triangleView.color = [UIColor colorFromHexCode:triangleColorHex];
}

- (void)addAnimations {
    [self.circleView runPulseAnimation];
    [self.squareView runShakeAnimationWithDuration:0.5 repeat:YES];
    [self.triangleView runSpinAnimationWithDuration:1 repeat:YES];
}

@end
