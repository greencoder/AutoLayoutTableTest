//
//  MasterViewController.m
//  ALTableViewCellTest
//
//  Created by Scott Newman on 9/30/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import "MasterViewController.h"
#import "NGCustomTableViewCell.h"

@interface MasterViewController ()

@property NSArray *items;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"SampleContent" ofType:@"plist"];
    self.items = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 84.0;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];

}

- (void)preferredContentSizeChanged:(NSNotification *)aNotification
{
    NSLog(@"preferredContentSizeChanged");
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NGCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *item = self.items[indexPath.row];

    cell.contentTitleLabel.text = item[@"title"];
    cell.contentTextLabel.text = item[@"text"];

    return cell;
}

@end
