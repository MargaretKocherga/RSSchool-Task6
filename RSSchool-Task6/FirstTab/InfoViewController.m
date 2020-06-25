//
//  InfoViewController.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "InfoViewController.h"
#import <Photos/Photos.h>
#import "InfoCell.h"
#import "InfoDetailsViewController.h"
#import "UIColor+Hex.h"

@interface InfoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Info";
    [self.tableView registerNib:[UINib nibWithNibName:@"InfoCell" bundle:nil] forCellReuseIdentifier:@"infoCell"];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(viewWillAppear:)
                                               name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized) {
        self.imageManager = [[PHCachingImageManager alloc] init];
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.assetsFetchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoCell *cell = (InfoCell *)[self.tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    [cell configureWithAsset:asset];
    UIView *selectedView = [UIView new];
    selectedView.backgroundColor = [UIColor colorFromHexCode:@"FDF4E3"];
    cell.selectedBackgroundView = selectedView;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoDetailsViewController *infoDetailsVC = [InfoDetailsViewController new];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    [infoDetailsVC configureWith:asset];
    [self.navigationController pushViewController:infoDetailsVC animated:YES];
}

@end
