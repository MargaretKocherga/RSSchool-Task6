//
//  InfoDetailsViewController.h
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PHAsset;

NS_ASSUME_NONNULL_BEGIN

@interface InfoDetailsViewController : UIViewController

- (void)configureWith:(PHAsset *)asset;

@end

NS_ASSUME_NONNULL_END
