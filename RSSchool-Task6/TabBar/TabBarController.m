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
#import "InfoViewController.h"
#import "UIColor+Hex.h"

@implementation TabBarController

- (void)viewDidLoad
{
    self.tabBar.tintColor = UIColor.blackColor;

    UIViewController *firstViewController = [InfoViewController new];
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
        nc.tabBarItem = [UITabBarItem new];
        nc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);

        nc.navigationBar.barTintColor = [UIColor colorFromHexCode:@"F9CC78"];
        nc.navigationBar.tintColor = [UIColor blackColor];
        nc.navigationBar.translucent = NO;
        nc.navigationBar.titleTextAttributes = @{
            NSForegroundColorAttributeName:[UIColor blackColor],
            NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]
        };
    }

    firstNC.tabBarItem.image = [UIImage imageNamed:@"info_unselected"];
    firstNC.tabBarItem.selectedImage = [UIImage imageNamed:@"info_selected"];

    secondNC.tabBarItem.image = [UIImage imageNamed:@"gallery_unselected"];
    secondNC.tabBarItem.selectedImage = [UIImage imageNamed:@"gallery_selected"];

    thirdNC.tabBarItem.image = [UIImage imageNamed:@"home_unselected"];
    thirdNC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];

    self.viewControllers = NCs;

    self.selectedIndex = 1;
}

@end
