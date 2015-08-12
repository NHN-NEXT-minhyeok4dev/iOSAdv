//
//  AddPersonViewController.m
//  test7
//
//  Created by 김민혁 on 8/12/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()


@end

@implementation AddPersonViewController

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
    if (sender != self.saveButton) return;
    self.person = @{
                    @"name" : self.nameField.text,
                    @"age" : @([self.ageField.text intValue])
                    };
}




@end
