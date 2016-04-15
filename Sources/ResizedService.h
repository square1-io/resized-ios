//
//  ResizedImage.h
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

@import UIKit;

@interface ResizedService : NSObject


+ (instancetype)resizedServiceWithServerBaseURL:(NSString *)url
                                            key:(NSString *)key;

+ (instancetype)resizedServiceWithServerBaseURL:(NSString *)url
                                            key:(NSString *)key
                                    placeholder:(NSString *)placeholderURL;

- (instancetype)initWithServerBaseURL:(NSString *)url
                                  key:(NSString *)key;

- (instancetype)initWithServerBaseURL:(NSString *)url
                                  key:(NSString *)key
                          placeholder:(NSString *)placeholderURL;

- (NSString *)uriForImage:(NSString *)imageURL
                 withSize:(CGSize)size;

- (NSString *)uriForImage:(NSString *)imageURL
                 withSize:(CGSize)size
              placeholder:(NSString *)placeholderURL;
;

@end
