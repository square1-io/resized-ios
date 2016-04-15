//
//  ResizedImage.m
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

#import "ResizedService.h"
#import "NSString+Resized.h"

@interface ResizedService()

@property NSString *serverBaseURL;
@property NSString *key;
@property NSString *placeholderURL;

@end

@implementation ResizedService

+ (instancetype)resizedServiceWithServerBaseURL:(NSString *)url
                                            key:(NSString *)key
{
    return [ResizedService resizedServiceWithServerBaseURL:url
                                                       key:key
                                               placeholder:nil];
}

+ (instancetype)resizedServiceWithServerBaseURL:(NSString *)url
                                            key:(NSString *)key
                                    placeholder:(NSString *)placeholderURL
{
    return [[ResizedService alloc] initWithServerBaseURL:url
                                                     key:key
                                             placeholder:placeholderURL];
}

- (instancetype)initWithServerBaseURL:(NSString *)url
                                  key:(NSString *)key
{
    return [self initWithServerBaseURL:url
                                   key:key
                           placeholder:nil];
}

- (instancetype)initWithServerBaseURL:(NSString *)url
                                  key:(NSString *)key
                          placeholder:(NSString *)placeholderURL
{
    if (self = [super init]) {
        _serverBaseURL = url;
        _key = key;
        _placeholderURL = placeholderURL;
    }
    
    return self;
}

- (NSString*)uriForImage:(NSString*)imageUrl
                withSize:(CGSize)size
{
    return [self uriForImage:imageUrl withSize:size placeholder:nil];
}

- (NSString*)uriForImage:(NSString*)imageUrl
                withSize:(CGSize)size
             placeholder:(NSString *)placeholderURL
{
    
    if (_serverBaseURL == nil || _key == nil) {
        return [self placeholderIfSupplied:placeholderURL];
    }
    
    if([imageUrl length] == 0){
        return [self placeholderIfSupplied:placeholderURL];
    }
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        return imageUrl;
    }
    
    if(size.width < 0 || size.height < 0){
        return imageUrl;
    }
    
    if(size.width == 0 && size.height == 0){
        return imageUrl;
    }
    
    NSMutableDictionary* mediaRequest = [NSMutableDictionary new];
    [mediaRequest setObject:imageUrl forKey:@"url"];
    [mediaRequest setObject: size.width > 0 ? [NSNumber numberWithInt:size.width] : [NSNull null] forKey:@"width"];
    [mediaRequest setObject: size.height > 0 ? [NSNumber numberWithInt:size.height] : [NSNull null] forKey:@"height"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mediaRequest
                                                       options:0
                                                         error:nil];
    NSString *data = [[NSString alloc] initWithData:jsonData
                                           encoding:NSUTF8StringEncoding];
    
    NSString* hash = [data sha1WithKey:_key];
    
    NSDictionary* encodedData = @{@"data":data,
                                  @"hash":hash};
    
    jsonData = [NSJSONSerialization dataWithJSONObject:encodedData
                                               options:0
                                                 error:nil];
    data = [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
    
    return [_serverBaseURL stringByAppendingString:[data base64EncodedString]];
}

- (NSString *)placeholderIfSupplied:(NSString *)placeholder
{
    if (!placeholder.isEmpty) {
        return placeholder;
    }
    
    if (!_placeholderURL.isEmpty) {
        return _placeholderURL;
    }
    
    return nil;
}

@end
