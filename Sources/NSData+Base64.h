//
//  NSData+Base64.h
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

@import Foundation;

@interface NSData (Base64)

+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;

@end
