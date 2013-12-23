//
//  BRYExampleViewController.m
//  BRYPhotoTableViewExample
//
//  Created by Bryan Irace on 12/22/13.
//  Copyright (c) 2013 Bryan Irace. All rights reserved.
//

#import "BRYExampleViewController.h"

static CGFloat const TableHeight = 150;
static CGFloat const RowCount = 12;
static NSString * const CellIdentifier = @"CellIdentifier";

@implementation BRYExampleViewController

- (id)init {
    if (self = [super init]) {
        self.tableHeight = TableHeight;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return RowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
}

@end
