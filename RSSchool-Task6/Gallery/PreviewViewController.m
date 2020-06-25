
#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)configureWithImage:(UIImage *)image
{
    self.view.backgroundColor = UIColor.whiteColor;
    UIImageView *imageView = [UIImageView new];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:imageView];
    [NSLayoutConstraint activateConstraints:@[
        [imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [imageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
        [imageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [imageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];

    UIButton *closeButton = [UIButton new];
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [self.view addSubview:closeButton];
    [NSLayoutConstraint activateConstraints:@[
        [closeButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [closeButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20]
    ]];
    [closeButton addTarget:self action:@selector(closeViewController) forControlEvents:UIControlEventTouchUpInside];
}

- (void)closeViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
