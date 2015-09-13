//
//  MainViewController.m
//  test11
//
//  Created by 김민혁 on 9/9/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property NSDate *birthdayDate;
@property NSString *myLocaleIdentifier;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:4];
    [comps setMonth:3];
    [comps setYear:1982];
    
    NSString *countryCode = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
    if ([countryCode isEqualToString:@"US"]) {
        self.birthdayDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
        self.myLocaleIdentifier = @"en_US";
    } else if ([countryCode isEqualToString:@"KR"]){
        self.birthdayDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
        self.myLocaleIdentifier = @"ko_KR";
    } else if ([countryCode isEqualToString:@"PT"]) {
        self.birthdayDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
        self.myLocaleIdentifier = @"pt_PT";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showBirthdayAlert:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:self.myLocaleIdentifier]];
    formatter.formatterBehavior = NSDateFormatterBehavior10_4;
    formatter.dateStyle = NSDateFormatterFullStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    NSString *result = [formatter stringForObjectValue:self.birthdayDate];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Birthday"
                                                   message:result
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"YES", nil];
    
    [alert show];
}

@end
