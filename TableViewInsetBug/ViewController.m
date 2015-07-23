//
//  ViewController.m
//  TableViewInsetBug
//
//  Created by Ryan Mathews on 7/21/15.
//  Copyright (c) 2015 Ryan Mathews. All rights reserved.
//

#import "ViewController.h"
#import "TextCellsTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"manyCellSegue"]) {
        TextCellsTableViewController *tableView = segue.destinationViewController;
        tableView.numOfRows = 15;
    }
    else {
        TextCellsTableViewController *tableView = segue.destinationViewController;
        tableView.numOfRows = 1;
    }
}

@end
