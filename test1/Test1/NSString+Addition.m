//
//  NSString+Addition.m
//  Test1
//
//  Created by 김민혁 on 7/1/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "NSString+Addition.h"



@implementation NSString (Addition)


- (NSString *)urlencode {
    NSString * urlString = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlString;
}

- (NSString *)filterHangulWord{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableString* newString = [[NSMutableString alloc]init];
    
    for (NSUInteger i =0;i<[self length]; i++){
        unichar character = [self characterAtIndex:i];
        NSString* charString = [[NSString alloc] initWithCharacters:&character length:1];
        NSUInteger bytes = [charString lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        
        if(bytes != 1){
            [newString appendString:charString];
            
            unichar character = [self characterAtIndex:i+1];
            NSString* nextCharString = [[NSString alloc] initWithCharacters:&character length:1];
            NSUInteger nextBytes = [nextCharString lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
            
            if(nextBytes == 1){
                [result addObject:[newString copy]];
                [newString setString:@""];
            }
        }
    }
    
    NSString *output = [[result valueForKey:@"description"] componentsJoinedByString:@" , "];

    return output;
}

@end
