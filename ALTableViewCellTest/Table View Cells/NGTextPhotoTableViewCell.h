//
//  NGTextPhotoTableViewCell.h
//  ALTableViewCellTest
//
//  Created by Scott Newman on 10/6/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGTextPhotoTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *contentTitleLabel;
@property (nonatomic, strong) UILabel *contentTextLabel;
@property (nonatomic, strong) UIImageView *contentThumb;
@property (nonatomic, strong) NSDictionary *contentDict;

@end
