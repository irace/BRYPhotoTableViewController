//
//  BIPhotoTableViewController.m
//  PhotoTableViewController
//
//  Created by Bryan Irace on 6/17/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

#import "BIPhotoTableViewController.h"

#define TableHeight 150

@interface UIView(Debug)

- (void)debug;

- (void)debug:(UIColor *)color;

@end

@implementation UIView(Debug)

- (void)debug {
    [self debug:[UIColor redColor]];
}

- (void)debug:(UIColor *)color {
    self.layer.borderWidth = 1;
    self.layer.borderColor = color.CGColor;
}

@end

@interface BIPhotoTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *photoView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableBackgroundView;

@property (nonatomic, strong) UIToolbar *topBar;
@property (nonatomic, strong) UIToolbar *bottomBar;

@end

@implementation BIPhotoTableViewController

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    self.photoView.image = backgroundImage;
}

#pragma mark - NSObject

- (id)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.photoView = [[UIImageView alloc] init];
        self.photoView.contentMode = UIViewContentModeScaleAspectFit;
        self.photoView.backgroundColor = [UIColor blackColor];
        
        // TODO: Gradient if background not tall enough
    }
    
    return self;
}

#pragma mark - UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.view addSubview:self.photoView];
    
    self.tableBackgroundView = [[UIView alloc] init];
    self.tableBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableBackgroundView];
    
    // TODO: Toolbar
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    [self.view addSubview:self.tableView];
    
    UIToolbar *(^addToolbar)(CGFloat) = ^UIToolbar *(CGFloat alpha) {
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.barStyle = UIBarStyleBlack;

        [toolbar sizeToFit];
        [self.view addSubview:toolbar];
        
        return toolbar;
    };
          
    self.topBar = addToolbar(0);
    self.bottomBar = addToolbar(0.7);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // TODO: Use auto-layout
    
    CGRect bounds = self.view.bounds;
    
    // TODO: Figure out how to align to top
    self.photoView.frame = bounds;
    
    self.tableView.frame = bounds;
    UIEdgeInsets insets = UIEdgeInsetsMake(CGRectGetHeight(bounds) - TableHeight, 0, CGRectGetHeight(self.bottomBar.bounds), 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    // TODO: Can throw this up too high
    self.tableBackgroundView.frame = CGRectMake(0, insets.top, CGRectGetWidth(bounds), TableHeight);
    
    CGRect bottomBarFrame = self.bottomBar.bounds;
    bottomBarFrame.origin.y = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(bottomBarFrame);
    self.bottomBar.frame = bottomBarFrame;
    
    [self.topBar debug];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    CGFloat insetHeight = CGRectGetHeight(scrollView.bounds) - TableHeight;
    
    UIEdgeInsets scrollInsets = scrollView.scrollIndicatorInsets;
    scrollInsets.top = MIN(MAX(-yOffset, 0), insetHeight);
    scrollView.scrollIndicatorInsets = scrollInsets;

    self.topBar.alpha = (insetHeight + yOffset)/insetHeight;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    
    return cell;
}

@end
