//
//  AddItemViewController.m
//  test9
//
//  Created by 김민혁 on 8/26/15.
//  Copyright (c) 2015 MinHyeok Kim. All rights reserved.
//

#import "AddItemViewController.h"
#import "NSMutableDictionary+Serialization.h"
@import Security;

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *keyField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property NSMutableDictionary *myDictionary;


@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myDictionary = [[NSMutableDictionary alloc] init];

    NSData *data = [self getDataByKeychain];
    if(data){
        [self.myDictionary deserializeByXml:data];
        [self printByEnumerator:[self.myDictionary keyEnumerator]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveAction:(id)sender {
    [self.myDictionary setObject:self.valueField.text forKey:self.keyField.text];

    NSLog(@"new Key : %@, new Value : %@", self.keyField.text, self.valueField.text);
    [self printByEnumerator:[self.myDictionary keyEnumerator]];
    
    NSData *data = [self.myDictionary serializeToXml];
    [self saveKeyChainWithData:data];
    
    NSData *new_data = [self getDataByKeychain];
    
    
}

- (void)printByEnumerator:(NSEnumerator*)enumerator {
    id key;
    
    while ((key = [enumerator nextObject])) {
        NSLog(@"I have key : %@, and value : %@", key, [self.myDictionary objectForKey:key]);
    }
}

- (void)saveKeyChainWithData:(NSData *)data{
    NSMutableDictionary *removeQuery = [[NSMutableDictionary alloc] init];
    [removeQuery setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)(removeQuery));
    
    
    NSMutableDictionary *saveQuery = [[NSMutableDictionary alloc] init];
    [saveQuery setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    NSData *encodedKey = [@"testkey" dataUsingEncoding:NSUTF8StringEncoding];
    [saveQuery setObject:encodedKey forKey:(__bridge id)kSecAttrGeneric];
    [saveQuery setObject:encodedKey forKey:(__bridge id)kSecAttrAccount];
    [saveQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    
    
    [saveQuery setObject:data forKey:(__bridge id)kSecValueData];
    
    status = SecItemAdd((__bridge CFDictionaryRef)saveQuery, NULL);
    if(errSecSuccess != status){
        NSLog(@"Unable add item with key =%@ error:%ld",@"testkey",status);
    }
}

- (NSData *)getDataByKeychain {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    NSData *encodedKey = [@"testkey" dataUsingEncoding:NSUTF8StringEncoding];
    [dict setObject:encodedKey forKey:(__bridge id)kSecAttrGeneric];
    [dict setObject:encodedKey forKey:(__bridge id)kSecAttrAccount];
    [dict setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [dict setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    
    CFTypeRef result = NULL;
    
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)dict, &result);
    
    if(status != errSecSuccess){
        NSLog(@"Unable to fetch item for key %@ with error:%ld",@"testkey",status);
        return nil;
    }
    
    NSData *resultData = (__bridge NSData *)result;
    
    return resultData;
}
@end
