//
//  SetupViewController.m
//  test6
//
//  Created by 김민혁 on 8/5/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    self.date = [self.datePicker date];
}

@end
