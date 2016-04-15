//
//  NSString+Resized.h
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

@import Foundation;

@interface NSString (Resized)

- (NSString *)sha1WithKey:(NSString *)key;
- (NSString *)base64EncodedString;
- (BOOL)isEmpty;

@end
