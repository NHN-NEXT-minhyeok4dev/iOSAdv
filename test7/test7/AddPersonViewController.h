//
//  AddPersonViewController.h
//  test7
//
//  Created by 김민혁 on 8/12/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AddPersonViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property NSDictionary *person;

@end
