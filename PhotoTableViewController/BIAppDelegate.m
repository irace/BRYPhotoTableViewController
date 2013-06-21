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
        
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Title";
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    BIPhotoTableViewController *controller = [[BIPhotoTableViewController alloc] init];
    controller.backgroundImage = [UIImage imageNamed:@"ram.jpg"];
    controller.topBar.items = @[flex, [[UIBarButtonItem alloc] initWithCustomView:label], flex];
    
    self.window.rootViewController = controller;

    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
