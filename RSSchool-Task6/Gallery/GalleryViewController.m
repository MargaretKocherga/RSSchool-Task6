//
//  GalleryViewController.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "GalleryViewController.h"
#import <Photos/Photos.h>
#import "GalleryImageCell.h"
#import "PreviewViewController.h"

@interface GalleryViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@end

@implementation GalleryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Gallery";

    [self.collectionView registerNib:[UINib nibWithNibName:@"GalleryImageCell" bundle:nil] forCellWithReuseIdentifier:@"galleryCell"];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(viewWillAppear:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized) {
        self.imageManager = [[PHCachingImageManager alloc] init];
        [self.collectionView reloadData];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assetsFetchResults.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat availableWidth = self.collectionView.bounds.size.width - 50;
    CGFloat cellSize = availableWidth / 3;
    return CGSizeMake(cellSize, cellSize);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GalleryImageCell *cell =
        [collectionView dequeueReusableCellWithReuseIdentifier:@"galleryCell" forIndexPath:indexPath];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    [self.imageManager requestImageForAsset:asset targetSize:cell.imageView.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
     {
        cell.imageView.image = result;
    }];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    [self.imageManager requestImageForAsset:asset targetSize:self.view.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info) {
        if (((NSNumber *)info[PHImageResultIsDegradedKey]).boolValue == YES) {
            return;
        }
        PreviewViewController *previewController = [PreviewViewController new];
        [previewController configureWithImage:result];
        previewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:previewController animated:YES completion:nil];
    }];
}

@end
