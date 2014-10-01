//
//  NGCustomTableViewCell.m
//  ALTableViewCellTest
//
//  Created by Scott Newman on 9/30/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import "NGCustomTableViewCell.h"

@interface NGCustomTableViewCell ()

@end

@implementation NGCustomTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        // Set up the headline text label
        _contentTitleLabel = [[UILabel alloc] init];
        _contentTitleLabel.numberOfLines = 0;
        _contentTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _contentTitleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_contentTitleLabel];
        
        // Set up the subheadline text label
        _contentTextLabel = [[UILabel alloc] init];
        _contentTextLabel.numberOfLines = 0;
        _contentTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_contentTextLabel];

        // Set the fonts
        [self updateFonts];

        // Add the constraints
        NSDictionary *views = NSDictionaryOfVariableBindings(_contentTitleLabel, _contentTextLabel);
        NSDictionary *metrics = @{ @"vPadding": @10, @"hPadding": @12 };
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hPadding)-[_contentTitleLabel]-(hPadding)-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hPadding)-[_contentTextLabel]-(hPadding)-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vPadding)-[_contentTitleLabel]-[_contentTextLabel]-(vPadding)-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
    }
    return self;
}

- (void)updateFonts
{
    _contentTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    _contentTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
 
    // This needs to be here otherwise view resize events (like rotation) won't
    // update the height of the cell
    [self.contentView layoutIfNeeded];
    
    self.contentTitleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentTitleLabel.frame);
    self.contentTextLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentTextLabel.frame);
}

@end
