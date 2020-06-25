//
//  TabBarController.m
//  RSSchool-Task6
//
//  Created by Margo on 6/25/20.
//  Copyright © 2020 Margo. All rights reserved.
//

#import "TabBarController.h"
#import "GalleryViewController.h"
#import "ThirdTabViewController.h"
#import "UIColor+Hex.h"

@implementation TabBarController

- (void)viewDidLoad
{
    UIViewController *firstViewController = [UIViewController new];
    UIViewController *secondViewController = [GalleryViewController new];
    UIViewController *thirdViewController = [ThirdTabViewController new];

    UINavigationController *firstNC = [UINavigationController new];
    firstNC.viewControllers = @[firstViewController];
    UINavigationController *secondNC = [UINavigationController new];
    secondNC.viewControllers = @[secondViewController];
    UINavigationController *thirdNC = [UINavigationController new];
    thirdNC.viewControllers = @[thirdViewController];

    NSArray<UINavigationController *> *NCs = @[firstNC, secondNC, thirdNC];

    for (UINavigationController *nc in NCs) {
        nc.navigationBar.barTintColor = [UIColor colorFromHexCode:@"F9CC78"];
        nc.navigationBar.tintColor = [UIColor blackColor];
        nc.navigationBar.translucent = NO;
        nc.navigationBar.titleTextAttributes = @{
            NSForegroundColorAttributeName:[UIColor blackColor],
            NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]
        };
    }

    self.viewControllers = NCs;

    self.selectedIndex = 1;
}

@end
