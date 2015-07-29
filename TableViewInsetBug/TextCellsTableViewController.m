//
//  TextCellsTableViewController.m
//  TableViewInsetBug
//
//  Created by Ryan Mathews on 7/21/15.
//  Copyright (c) 2015 Ryan Mathews. All rights reserved.
//

#import "TextCellsTableViewController.h"
#import "TextTableViewCell.h"

@interface TextCellsTableViewController ()

@end

@implementation TextCellsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.estimatedRowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)didMoveToParentViewController:(UIViewController *)parent
//{
//    if (parent) {
//        CGFloat top = parent.topLayoutGuide.length;
//        CGFloat bottom = parent.bottomLayoutGuide.length;
//        
//        // this is the most important part here, because the first view controller added
//        // never had the layout issue, it was always the second. if we applied these
//        // edge insets to the first view controller, then it would lay out incorrectly.
//        // first detect if it's laid out correctly with the following condition, and if
//        // not, manually make the adjustments since it seems like UIKit is failing to do so
//        if (self.tableView.contentInset.top != top) {
//            UIEdgeInsets newInsets = UIEdgeInsetsMake(top, 0, bottom, 0);
//            NSLog(@"setting new insets: %@", NSStringFromUIEdgeInsets(newInsets));
//            self.tableView.contentInset = newInsets;
//            self.tableView.scrollIndicatorInsets = newInsets;
//        }
//    }
//    
//    [super didMoveToParentViewController:parent];
//}
//
//- (void) viewDidLayoutSubviews {
//    CGFloat top = self.topLayoutGuide.length;
//    CGFloat bottom = self.bottomLayoutGuide.length;
//    UIEdgeInsets newInsets = UIEdgeInsetsMake(top, 0, bottom, 0);
//    self.tableView.contentInset = newInsets;
//    
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"Row %li", (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextTableViewCell *cell = (TextTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell.textView becomeFirstResponder];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
