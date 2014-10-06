//
//  NGCustomTableViewCell.h
//  ALTableViewCellTest
//
//  Created by Scott Newman on 9/30/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGTextOnlyTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *contentTitleLabel;
@property (nonatomic, strong) UILabel *contentTextLabel;
@property (nonatomic, strong) NSDictionary *contentDict;

@end
