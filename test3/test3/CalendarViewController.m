//
//  CalendarViewController.m
//  test3
//
//  Created by 김민혁 on 7/15/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self makeCalendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeCalendar {
    float x = 10;
    float y = 80;
    float width = 25;
    float height = 30;
    int date = 1;
    for(int i =1;i<=35;i++)
    {
        // 7월일때의 offset, 매 월을 표시하려면 이 offset 조건이 달라지면 되겠지요..
        if (i>=4 && i<=34){
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btn setFrame:CGRectMake(x, y, width, height)];
            [btn setTitle:[NSString stringWithFormat:@"%d",date] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.view addSubview:btn];
            date++;
        }
        
        x = x + width + 20;
        
        if((i)%7==0)
        {
            x = 10;
            y = y + height + 20;
        }
    }
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
