//
//  BRYAppDelegate.m
//  BRYPhotoTableViewExample
//
//  Created by Bryan Irace on 12/22/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

#import "BRYAppDelegate.h"
#import "BRYExampleViewController.h"

@implementation BRYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Random Access Memories";
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil action:nil];
    
    BRYExampleViewController *controller = [[BRYExampleViewController alloc] init];
    controller.backgroundImage = [UIImage imageNamed:@"ram.jpg"];
    controller.topBar.items = @[flexibleSpace, [[UIBarButtonItem alloc] initWithCustomView:label], flexibleSpace];
    
    self.window.rootViewController = controller;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
