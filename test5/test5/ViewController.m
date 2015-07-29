//
//  ViewController.m
//  test5
//
//  Created by 김민혁 on 7/29/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *splitView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewInTopView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewInBottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSplitViewPosition:)];
    
    [self.splitView addGestureRecognizer:panGestureRecognizer];
    
    [self setImageViewFromURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) handleSplitViewPosition:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    self.heightConstraintForTopView.constant = touchLocation.y;
}

- (void) setImageViewFromURL {
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/139545/watch.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    self.imageViewInTopView = [[UIImageView alloc] initWithImage:image];
    
    url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/139545/iphone6.jpg"];
    data = [NSData dataWithContentsOfURL:url];
    image = [UIImage imageWithData:data];
    
    
    self.imageViewInBottomView = [[UIImageView alloc] initWithImage:image];
}


@end
