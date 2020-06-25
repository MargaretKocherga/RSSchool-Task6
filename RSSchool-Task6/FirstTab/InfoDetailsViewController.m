//
//  InfoDetailsViewController.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "InfoDetailsViewController.h"
#import <Photos/Photos.h>

@interface InfoDetailsViewController ()

@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UILabel *creationDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *modificationDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) PHAsset *asset;

@end

@implementation InfoDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.creationDateLabel.text = [self stringFromDate:self.asset.creationDate];
    self.modificationDateLabel.text = [self stringFromDate:self.asset.modificationDate ];
    self.navigationItem.title = [self.asset valueForKey:@"filename"];
    switch (self.asset.mediaType) {
        case PHAssetMediaTypeImage:
            self.typeLabel.text = @"Image";
            break;
        case PHAssetMediaTypeAudio:
            self.typeLabel.text = @"Audio";
            break;
        case PHAssetMediaTypeVideo:
            self.typeLabel.text = @"Video";
            break;
        case PHAssetMediaTypeUnknown:
            self.typeLabel.text = @"Unknown";
            break;
    }
    self.shareButton.layer.cornerRadius = 27.5;
}


- (void)configureWith:(PHAsset *)asset
{
    self.asset = asset;

    PHCachingImageManager *imageManager = [PHCachingImageManager new];
    [imageManager requestImageForAsset:asset
                            targetSize:PHImageManagerMaximumSize
                           contentMode:PHImageContentModeAspectFit
                               options:nil
                         resultHandler:^(UIImage *result, NSDictionary *info)
     {
        CGFloat ratio = result.size.height / result.size.width;
        self.imageView.image = result;
        [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor multiplier:ratio].active = YES;
    }];
}

- (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter * formatter =  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss dd.MM.yyyy"];
    return [formatter stringFromDate:date];
}

- (IBAction)shareButtonPressed:(id)sender {
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.imageView.image]
                                                                             applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
