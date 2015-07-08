//
//  ViewController.m
//  test2
//
//  Created by 김민혁 on 7/8/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myView;
@end

CGPoint initLocation;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];

    
//  LongPressGesture로 딜레이를 감소시킬 수 있었다.
//    UILongPressGestureRecognizer *panGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
//    panGestureRecognizer.minimumPressDuration=0;
    
    UITapGestureRecognizer *tabGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    tabGestureRecognizer.numberOfTouchesRequired = 1;
    tabGestureRecognizer.numberOfTapsRequired = 2;
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGestrue:)];

    [self.myView addGestureRecognizer:pinchGestureRecognizer];
    [self.myView addGestureRecognizer:panGestureRecognizer];
    [self.view addGestureRecognizer:tabGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)animated{
    [self becomeFirstResponder];
    
    initLocation = self.myView.center;
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake)
    {
        self.myView.center = initLocation;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    self.myView.center = touchLocation;
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
                self.myView.center = initLocation;
        }];
    }
}

-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    CGPoint touchLocation = [tapGestureRecognizer locationInView:self.view];
    self.myView.center = touchLocation;
}

-(void)handlePinchGestrue:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    self.myView.transform = CGAffineTransformScale(self.myView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    
    pinchGestureRecognizer.scale = 1.0;
}


@end
