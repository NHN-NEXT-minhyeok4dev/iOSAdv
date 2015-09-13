//
//  NSMutableDictionary+Serialization.m
//  test9
//
//  Created by 김민혁 on 8/26/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "NSMutableDictionary+Serialization.h"

@implementation NSMutableDictionary (Serialization)


- (NSData *)serializeToXml {
    NSError *err;
    
    NSData* data =  [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:nil error:&err];
    
    return data;
}

- (NSMutableDictionary *)deserializeByXml:(NSData *)data {
    return [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:nil error:nil];
}
@end
