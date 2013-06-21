//
//  BIPhotoTableViewController.h
//  PhotoTableViewController
//
//  Created by Bryan Irace on 6/17/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIPhotoTableViewController : UIViewController

@property (nonatomic, strong, readonly) UIImageView *photoView;
@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong, readonly) UIToolbar *topBar;
@property (nonatomic, strong, readonly) UIToolbar *bottomBar;

@property (nonatomic, strong) UIImage *backgroundImage;

@end
