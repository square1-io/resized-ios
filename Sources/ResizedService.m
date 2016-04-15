//
//  ResizedImage.m
//  Resized
//
//  Created by Rober Pastor on 5/4/16.
//
//

#import "ResizedService.h"
#import "NSString+Resized.h"

#define kDefaultHost @"https://img.resized.co/"

@interface ResizedService()

@property NSString *key;
@property NSString *secret;

@end

@implementation ResizedService

+ (instancetype)serviceWithKey:(NSString *)key
                        secret:(NSString *)secret
{
    return [[ResizedService alloc] initWithKey:key secret:secret];
}


- (instancetype)initWithKey:(NSString *)key
                     secret:(NSString *)secret
{
    if (self = [super init]) {
        _host = kDefaultHost;
        _key = key;
        _secret = secret;
    }
    
    return self;
}

- (NSString *)resizeImage:(NSString *)imageURL
                 withSize:(CGSize)size
{
    // Check basic params
    if (_host == nil || _key == nil || _secret == nil) {
        return nil;
    }
    
    // Check input imageURL. If URL is malformed then use failover image
    if(![self validURL:imageURL]){
        imageURL = _defaultImageURL;
    }
    
    // Set params on media request (imageURL, width and height)
    NSMutableDictionary* mediaRequest = [NSMutableDictionary new];
    [mediaRequest setObject:imageURL forKey:@"url"];
    [mediaRequest setObject: size.width > 0 ? [NSNumber numberWithInt:size.width] : [NSNull null] forKey:@"width"];
    [mediaRequest setObject: size.height > 0 ? [NSNumber numberWithInt:size.height] : [NSNull null] forKey:@"height"];
    
    // Transform params dictionary to data object...
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mediaRequest
                                                       options:0
                                                         error:nil];
    //...and data object into string
    NSString *stringData = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    
    // Generate hash encoding "key + secret + stringData" with SHA1
    NSString* hash = [stringData sha1WithKey:_key secret:_secret];
    
    // Generate URI
    NSDictionary* encodedData = @{@"data":stringData, @"hash":hash};
    
    jsonData = [NSJSONSerialization dataWithJSONObject:encodedData
                                               options:0
                                                 error:nil];
    
    stringData = [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
    
    NSString *uri = [stringData base64EncodedString];
    
    // Compose request URL
    NSURL *requestURL = [NSURL URLWithString:_host];
    requestURL = [requestURL URLByAppendingPathComponent:_key];
    requestURL = [requestURL URLByAppendingPathComponent:uri];
    
    // Return request URL
    return requestURL.absoluteString;
}

- (BOOL)validURL:(NSString *)stringURL
{
    NSURL *url = [NSURL URLWithString:stringURL];
    
    if (url && url.scheme && url.host) {
        return YES;
    } else {
        return NO;
    }
    
    
}

@end
