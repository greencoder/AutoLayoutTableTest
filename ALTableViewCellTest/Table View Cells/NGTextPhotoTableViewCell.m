//
//  NGTextPhotoTableViewCell.m
//  ALTableViewCellTest
//
//  Created by Scott Newman on 10/6/14.
//  Copyright (c) 2014 National Geographic. All rights reserved.
//

#import "NGTextPhotoTableViewCell.h"

@interface NGTextPhotoTableViewCell ()

- (void)updateFonts;

@end

@implementation NGTextPhotoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];    
    if(self)
    {
        // Set up image view
        _contentThumb = [[UIImageView alloc] init];
        _contentThumb.contentMode = UIViewContentModeScaleAspectFill;
        _contentThumb.translatesAutoresizingMaskIntoConstraints = NO;
        _contentThumb.image = [UIImage imageNamed:@"defaultThumb.png"];
        [self.contentView addSubview:_contentThumb];
        
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
        NSDictionary *views = NSDictionaryOfVariableBindings(_contentTitleLabel, _contentTextLabel, _contentThumb);
        NSDictionary *metrics = @{ @"vPadding": @10, @"hPadding": @12 };
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_contentThumb(==70)]"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vPadding)-[_contentThumb(==70)]-(vPadding)-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hPadding)-[_contentTitleLabel]-[_contentThumb]-(hPadding)-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hPadding)-[_contentTextLabel]-[_contentThumb]-(hPadding)-|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vPadding)-[_contentTitleLabel]-[_contentTextLabel]"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        
    }
    return self;
}

- (void)setContentDict:(NSDictionary *)contentDict
{
    _contentTitleLabel.text = contentDict[@"title"];
    _contentTextLabel.text = contentDict[@"text"];
    [self updateFonts];
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
    
    // Required to call this again to finalize any setup required
    [super layoutSubviews];
}

@end
