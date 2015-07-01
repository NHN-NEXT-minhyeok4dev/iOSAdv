//
//  ViewController.m
//  Test1
//
//  Created by 김민혁 on 7/1/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Addition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urlString = @"http://www.osxdev.org/forum/index.php?threads/ios8-에서-webgl-지원.356/";
    self.urlEncodedString = [self.urlString urlencode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)clickButton1:(id)sender {
    [self addAlertView];
}
- (IBAction)clickButton2:(id)sender {
    [self addAlertView2];
}

- (void)addAlertView{
    NSData* responseData = [self connectUsingSync];
    NSString *receivedDataString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Result" message:[receivedDataString substringToIndex:300] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alertView show];
}

- (void)addAlertView2{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Result" message:[self.urlString filterHangulWord] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alertView show];
}

- (NSData *)connectUsingSync {
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlEncodedString]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    if (error == nil)
    {
        return data;
    }
    return nil;
}

@end
