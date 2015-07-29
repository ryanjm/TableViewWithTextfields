//
//  TextTableViewCell.m
//  TableViewInsetBug
//
//  Created by Ryan Mathews on 7/21/15.
//  Copyright (c) 2015 Ryan Mathews. All rights reserved.
//

#import "TextTableViewCell.h"

@interface TextTableViewCell ()

@property (nonatomic) CGFloat textViewIntrinsicContentSizeHeight;

@end

@implementation TextTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
//    [self.textView setEditable:NO];
//    [self.textView setUserInteractionEnabled:NO];
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat intrinsicHeight = [textView intrinsicContentSize].height;
//    if (intrinsicHeight != 0 && intrinsicHeight != self.textViewIntrinsicContentSizeHeight) {
//        self.intrinsicContentSizeChangedBlock();
//    }
    self.textViewIntrinsicContentSizeHeight = intrinsicHeight;
}

@end
