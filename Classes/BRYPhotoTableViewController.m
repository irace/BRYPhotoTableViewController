//
//  BRYPhotoTableViewController.m
//  BRYPhotoTableViewController
//
//  Created by Bryan Irace on 12/22/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

#import "BRYPhotoTableViewController.h"

#define TableHeight 150

@interface BRYPhotoTableViewController ()

@property (nonatomic) UIImageView *photoView;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UIView *tableBackgroundView;
@property (nonatomic) UIToolbar *topBar;
@property (nonatomic) UIToolbar *bottomBar;

@end

@implementation BRYPhotoTableViewController

#pragma mark - NSObject

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.photoView = [[UIImageView alloc] init];
        self.photoView.contentMode = UIViewContentModeScaleAspectFit;
        self.photoView.backgroundColor = [UIColor blackColor];

        UIToolbar *(^newToolbarWithAlpha)(CGFloat) = ^UIToolbar *(CGFloat alpha) {
            UIToolbar *toolbar = [[UIToolbar alloc] init];
            toolbar.barStyle = UIBarStyleBlack;
            [toolbar sizeToFit];
            
            return toolbar;
        };
        
        self.topBar = newToolbarWithAlpha(0);
        self.bottomBar = newToolbarWithAlpha(0.7);
    }
    
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.photoView];
    
    self.tableBackgroundView = [[UIView alloc] init];
    self.tableBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableBackgroundView];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.topBar];
    
    [self.view addSubview:self.bottomBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect bounds = self.view.bounds;

    self.photoView.frame = bounds;
    
    self.tableView.frame = bounds;
    UIEdgeInsets insets = UIEdgeInsetsMake(CGRectGetHeight(bounds) - self.tableHeight, 0, CGRectGetHeight(self.bottomBar.bounds), 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    // TODO: Can throw this up too high
    self.tableBackgroundView.frame = CGRectMake(0, insets.top, CGRectGetWidth(bounds), self.tableHeight);
    
    CGRect bottomBarFrame = self.bottomBar.bounds;
    bottomBarFrame.origin.y = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(bottomBarFrame);
    self.bottomBar.frame = bottomBarFrame;
}

#pragma mark - BRYPhotoTableViewController

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    self.photoView.image = backgroundImage;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    CGFloat insetHeight = CGRectGetHeight(scrollView.bounds) - self.tableHeight;
    
    UIEdgeInsets scrollInsets = scrollView.scrollIndicatorInsets;
    scrollInsets.top = MIN(MAX(-yOffset, 0), insetHeight);
    scrollView.scrollIndicatorInsets = scrollInsets;
    
    self.topBar.alpha = (insetHeight + yOffset)/insetHeight;
}

@end
