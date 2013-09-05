//
//  AppDelegate.h
//  FSPhotoViewDemo
//
//  Created by Stephen Jin on 8/30/13.
//  Copyright (c) 2013 Stephen Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) FSViewController *viewController;

@end
