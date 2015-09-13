//
//  NSMutableDictionary+Serialization.h
//  test9
//
//  Created by 김민혁 on 8/26/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Serialization)
- (NSData*)serializeToXml;
- (NSMutableDictionary *)deserializeByXml:(NSData *)data;
@end
