//
//  NGCustomTableViewCell.m
//  ALTableViewCellTest
//
//  Created by Scott Newman on 9/30/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import "NGCustomTableViewCell.h"

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
        _contentTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        _contentTitleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_contentTitleLabel];
        
        // Set up the subheadline text label
        _contentTextLabel = [[UILabel alloc] init];
        _contentTextLabel.numberOfLines = 0;
        _contentTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _contentTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        [self.contentView addSubview:_contentTextLabel];

        NSDictionary *views = NSDictionaryOfVariableBindings(_contentTitleLabel, _contentTextLabel);
        NSDictionary *metrics = @{ @"vPadding": @10, @"hPadding": @12 };
        
        // Should these constraints be in layoutSubviews or updateConstraints instead? I have a feeling that by
        // putting them in initWithCoder, I'm not giving it the ability to update when the text size changes
        
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Not sure why this call is here - wouldn't it call layoutSubviews again?
    [self.contentView layoutIfNeeded];
    
    self.contentTitleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentTitleLabel.frame);
    self.contentTextLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentTextLabel.frame);
}



@end
