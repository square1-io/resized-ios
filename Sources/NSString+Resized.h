//
//  NSString+Resized.h
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

@import Foundation;

@interface NSString (Resized)

- (NSString *)sha1WithKey:(NSString *)key secret:(NSString *)secret;
- (NSString *)base64EncodedString;

@end
