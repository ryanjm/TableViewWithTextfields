//
//  ContainerViewController.m
//  TableViewInsetBug
//
//  Created by Ryan Mathews on 7/28/15.
//  Copyright (c) 2015 Ryan Mathews. All rights reserved.
//

#import "ContainerViewController.h"
#import "TextCellsTableViewController.h"

@interface ContainerViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic) BOOL addedSubview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayoutGuideConstraint;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addedSubview = false;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didChangePreferredContentSize:)
//                                                 name:UIContentSizeCategoryDidChangeNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChange:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    if (!self.addedSubview) {
        self.addedSubview = YES;
        [self selectViewForContainerView];
    }
}

// https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/CreatingCustomContainerViewControllers/CreatingCustomContainerViewControllers.html
- (void)selectViewForContainerView
{
    NSLog(@"selectViewForContainerView");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TextCellsTableViewController *tableVC = [storyboard instantiateViewControllerWithIdentifier:@"textCellsTableViewController"];
    tableVC.numOfRows = self.numOfRows;
    
    //    [self.navigationController pushViewController:self.topContainerController animated:YES];
//    [tableVC.view setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.containerView setBackgroundColor:[UIColor blueColor]];
    [tableVC.view setBackgroundColor:[UIColor greenColor]];
    
    // Try adding it under containerView
    [self addChildViewController:tableVC];
    tableVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:tableVC.view];
    [tableVC didMoveToParentViewController:self];
    
    
    // Try adding it directly
//    [self addChildViewController:tableVC];
//    tableVC.view.frame = self.view.bounds;
//    [self.view addSubview:tableVC.view];
//    [tableVC didMoveToParentViewController:self];
//    NSLog(@"self.view.bounds: %@", NSStringFromCGRect(self.view.bounds));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)keyboardWillChange:(NSNotification *)notification
{
    NSLog(@"keyboardWillChange");
    // Retrieve the keyboard begin / end frame values
    CGRect beginFrame = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame =  [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat delta = (endFrame.origin.y - beginFrame.origin.y);
    
//    NSLog(@"Keyboard YDelta %f -> B: %@, E: %@", delta, NSStringFromCGRect(beginFrame), NSStringFromCGRect(endFrame));
    
    // Construct the animation details
    NSTimeInterval duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    UIViewAnimationOptions options = (curve << 16) | UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        NSLog(@"delta: %f", delta);
        self.bottomLayoutGuideConstraint.constant += delta;
//        UIEdgeInsets inset = self.containerView.contentInset;
//        inset.bottom = (delta < 0.0) ? fabs(delta) : 0.0;
//        NSLog(@"inset: %@", NSStringFromUIEdgeInsets(inset));
//        self.containerView.contentInset = inset;
    } completion:nil];
}

@end
