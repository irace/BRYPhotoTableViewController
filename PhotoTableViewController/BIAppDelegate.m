//
//  BIAppDelegate.m
//  PhotoTableViewController
//
//  Created by Bryan Irace on 6/17/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

#import "BIAppDelegate.h"
#import "BIPhotoTableViewController.h"

@implementation BIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BIPhotoTableViewController *controller = [[BIPhotoTableViewController alloc] init];
    controller.backgroundImage = [UIImage imageNamed:@"ram.jpg"];
    
    self.window.rootViewController = controller;

    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
