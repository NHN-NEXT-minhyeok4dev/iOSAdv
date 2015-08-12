//
//  PersonTableViewController.h
//  test7
//
//  Created by 김민혁 on 8/12/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface PersonTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
@end
