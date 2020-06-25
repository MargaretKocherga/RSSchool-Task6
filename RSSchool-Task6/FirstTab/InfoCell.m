//
//  InfoCell.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "InfoCell.h"
#import <Photos/Photos.h>

@interface InfoCell ()

@property (strong, nonatomic) IBOutlet UIImageView *previewImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *fileTypeImageView;
@property (strong, nonatomic) IBOutlet UILabel *metaInfoLabel;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@property (strong, nonatomic) PHAsset *asset;

@end

@implementation InfoCell

- (PHCachingImageManager *)imageManager
{
    if (_imageManager != nil) { return _imageManager; }
    _imageManager = [[PHCachingImageManager alloc] init];
    return _imageManager;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.asset = nil;
}

- (void)configureWithAsset:(PHAsset *)asset
{
    self.asset = asset;
    self.titleLabel.text = [asset valueForKey:@"filename"];

    switch (asset.mediaType) {
        case PHAssetMediaTypeImage:
            self.fileTypeImageView.image = [UIImage imageNamed:@"image"];
            self.metaInfoLabel.text = [NSString stringWithFormat:@"%lux%lu", (unsigned long)asset.pixelWidth, (unsigned long)asset.pixelHeight];
            break;
        case PHAssetMediaTypeAudio:
            self.fileTypeImageView.image = [UIImage imageNamed:@"audio"];
            self.metaInfoLabel.text = [NSString stringWithFormat:@"%f seconds", asset.duration];
            break;
        case PHAssetMediaTypeVideo:
            self.fileTypeImageView.image = [UIImage imageNamed:@"video"];
            self.metaInfoLabel.text = [NSString stringWithFormat:@"%f seconds", asset.duration];
            break;
        case PHAssetMediaTypeUnknown:
            self.fileTypeImageView.image = [UIImage imageNamed:@"other"];
            self.metaInfoLabel.text = @"Unknown";
            break;
    }

    
    [self.imageManager requestImageForAsset:asset
                                 targetSize:self.previewImageView.frame.size
                                contentMode:PHImageContentModeAspectFill
                                    options:nil
                              resultHandler:^(UIImage *result, NSDictionary *info)
     {
        if (self.asset != asset) { return; }
        self.previewImageView.image = result;
    }];
}

@end
