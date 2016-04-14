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

@end

@implementation ResizedService

+ (instancetype)resizedServiceWithServerBaseURL:(NSString *)url key:(NSString *)key
{
    return [[ResizedService alloc] initWithServerBaseURL:url key:key];
}

- (instancetype)initWithServerBaseURL:(NSString *)url key:(NSString *)key
{
    if (self = [super init]) {
        _serverBaseURL = url;
        _key = key;
    }
    
    return self;
}

- (NSString*)uriForImage:(NSString*)imageUrl withSize:(CGSize)size
{
    if (_serverBaseURL == nil || _key == nil) {
        return nil;
    }
    
    if([imageUrl length] == 0){
        return nil;
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
    
    NSString* data = @"";
    
    NSMutableDictionary* mediaRequest = [NSMutableDictionary new];
    
    [mediaRequest setObject:imageUrl forKey:@"url"];
    [mediaRequest setObject: size.width > 0 ? [NSNumber numberWithInt:size.width] : [NSNull null] forKey:@"width"];
    [mediaRequest setObject: size.height > 0 ? [NSNumber numberWithInt:size.height] : [NSNull null] forKey:@"height"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mediaRequest options:0 error:nil];
    data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString* hash = [data sha1WithKey:_key];
    
    NSDictionary* encodedData = [NSDictionary dictionaryWithObjectsAndKeys:data,@"data",hash,@"hash", nil];
    jsonData = [NSJSONSerialization dataWithJSONObject:encodedData options:0 error:nil];
    data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return [_serverBaseURL stringByAppendingString:[data base64EncodedString]];
}

@end
