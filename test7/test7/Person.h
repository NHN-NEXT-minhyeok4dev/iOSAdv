//
//  Person.h
//  test7
//
//  Created by 김민혁 on 8/12/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;

@end
