//
//  MasterViewController.m
//  ALTableViewCellTest
//
//  Created by Scott Newman on 9/30/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import "MasterViewController.h"

#import "NGTextOnlyTableViewCell.h"
#import "NGTextPhotoTableViewCell.h"

@interface MasterViewController ()

@property NSArray *items;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"SampleContent" ofType:@"plist"];
    
    // Debug: Only use the first item
    self.items = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    // Use automatic row heights
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 84.0;

    // Observe the content size change so we can tell when the user changes their
    // system-wide type settings
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
    // Register our two types of table view cell subclasses for use
    [self.tableView registerClass:[NGTextPhotoTableViewCell class] forCellReuseIdentifier:@"PhotoCell"];
    [self.tableView registerClass:[NGTextOnlyTableViewCell class] forCellReuseIdentifier:@"TextCell"];
    
}

- (void)preferredContentSizeChanged:(NSNotification *)aNotification
{
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
    NSDictionary *contentDict = self.items[indexPath.row];
    
    if ([contentDict[@"showPhoto"] integerValue] == 1)
    {
        NSLog(@"textPhoto");
        NGTextPhotoTableViewCell *cell = (NGTextPhotoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PhotoCell" forIndexPath:indexPath];
        cell.contentDict = self.items[indexPath.row];
        return cell;
    }
    else
    {
        NSLog(@"textOnly");
        NGTextOnlyTableViewCell *cell = (NGTextOnlyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:indexPath];
        cell.contentDict = self.items[indexPath.row];
        return cell;
    }
    

}

@end
