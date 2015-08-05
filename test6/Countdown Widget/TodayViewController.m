//
//  TodayViewController.m
//  Countdown Widget
//
//  Created by 김민혁 on 8/5/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation TodayViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self){
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userDefaultsDidChange:)
                                                     name:NSUserDefaultsDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)userDefaultsDidChange:(NSNotification *)notification{
    [self refresh];
}

- (void)refresh{
    NSUserDefaults* sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.org.nhnnext.minhyeok4dev"];
    
    NSString* result = [sharedUserDefaults objectForKey:@"hourDifference"];
    if (result){
        self.myLabel.text = result;
    }
}

@end
