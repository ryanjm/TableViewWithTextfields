//
//  ViewController.m
//  TableViewInsetBug
//
//  Created by Ryan Mathews on 7/21/15.
//  Copyright (c) 2015 Ryan Mathews. All rights reserved.
//

#import "ViewController.h"
#import "ContainerViewController.h"
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
        ContainerViewController *tableView = segue.destinationViewController;
        tableView.title = @"Not working - many";
        tableView.numOfRows = 15;
    }
    else if ([[segue identifier] isEqualToString:@"basicTVC"]) {
        TextCellsTableViewController *tableView = segue.destinationViewController;
        tableView.title = @"Working - many";
        tableView.numOfRows = 15;
    }
    else {
        ContainerViewController *tableView = segue.destinationViewController;
        tableView.title = @"Not working - one";
        tableView.numOfRows = 1;
    }
}

@end
