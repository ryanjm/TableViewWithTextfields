//
//  TextTableViewCell.h
//  TableViewInsetBug
//
//  Created by Ryan Mathews on 7/21/15.
//  Copyright (c) 2015 Ryan Mathews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
