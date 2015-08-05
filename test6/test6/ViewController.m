//
//  ViewController.m
//  test6
//
//  Created by 김민혁 on 8/5/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "ViewController.h"
#import "SetupViewController.h"
#import "DateTools.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *differenceTwoDates;
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

- (IBAction)unwindToMainView:(UIStoryboardSegue *)segue {
    SetupViewController *source = [segue sourceViewController];
    NSDate* endDate = source.date;
    
    double hourDifference = [endDate hoursFrom:[NSDate date]];
    
    if (hourDifference >= 0)
        self.differenceTwoDates.textColor = [UIColor greenColor];
    else
        self.differenceTwoDates.textColor = [UIColor redColor];
    
    [self.differenceTwoDates setText:[NSString stringWithFormat:@"%d hours", (int)hourDifference]];
    [self shareForExtensions:[NSString stringWithFormat:@"%d hours", (int)hourDifference]];
}

- (void)shareForExtensions:(NSString *)hourDifference{
    NSUserDefaults* sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.org.nhnnext.minhyeok4dev"];
    
    [sharedUserDefaults setObject:hourDifference forKey:@"hourDifference"];
    [sharedUserDefaults synchronize];
}

@end
