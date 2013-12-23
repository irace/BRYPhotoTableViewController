//
//  BRYPhotoTableViewController.h
//  BRYPhotoTableViewController
//
//  Created by Bryan Irace on 12/22/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface BRYPhotoTableViewController : UIViewController <UITableViewDelegate>

@property (nonatomic, readonly) UIImageView *photoView;
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) UIToolbar *topBar;
@property (nonatomic, readonly) UIToolbar *bottomBar;

@property (nonatomic) UIImage *backgroundImage;

@property (nonatomic) CGFloat tableHeight;

@end
