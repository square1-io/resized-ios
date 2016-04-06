//
//  ResizedImage.h
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

@import UIKit;

@interface ResizedService : NSObject


+ (instancetype)resizedServiceWithServerBaseURL:(NSString *)url key:(NSString *)key;
- (instancetype)initWithServerBaseURL:(NSString *)url key:(NSString *)key;

- (NSString *)uriForImage:(NSString *)imageURL withSize:(CGSize)size;

@end
