
//  MainCollectionViewController.m
//  test10
//
//  Created by 김민혁 on 9/2/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "MyCollectionViewCell.h"

@interface MainCollectionViewController () <NSURLConnectionDataDelegate>
@property NSMutableData *responseData;
@property NSArray *responseArray;
@end

@implementation MainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"http://125.209.194.123/json.php"]];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.responseData = [[NSMutableData alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.responseArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    __block NSString *imageURL;
    __block UIImage *image;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        imageURL = [self.responseArray[indexPath.row] objectForKey:@"image"];
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            [cell.myImage setImage:image];
        });
    });

    return cell;
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *responseString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSError *e = nil;
    NSData *jsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    
    self.responseArray = (NSArray *)[NSJSONSerialization JSONObjectWithData:jsonData options:nil error:&e];
    [self.collectionView reloadData];
}
@end
