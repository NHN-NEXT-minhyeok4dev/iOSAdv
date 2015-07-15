//
//  ViewController.m
//  test3
//
//  Created by 김민혁 on 7/15/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSecondViewController:(id)sender {
    UIViewController *secondViewController = [[UIStoryboard storyboardWithName:@"Second" bundle:nil] instantiateInitialViewController];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
