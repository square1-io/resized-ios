//
//  NSString+Resized.m
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

#import "NSString+Resized.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Base64.h"

@implementation NSString (Resized)

- (NSString *)sha1WithKey:(NSString *)key secret:(NSString *)secret
{
    NSString* input =[NSString stringWithFormat:@"%@%@%@", key, secret, self];
    
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

- (NSString *)base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedString];
}

@end