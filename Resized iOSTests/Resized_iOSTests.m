//
//  Resized_iOSTests.m
//  Resized iOSTests
//
//  Created by Rober Pastor on 6/4/16.
//
//

#import <XCTest/XCTest.h>
#import "Resized.h"

@interface Resized_iOSTests : XCTestCase

@property NSString *baseURL;
@property NSString *key;

@end

@implementation Resized_iOSTests

- (void)setUp
{
    [super setUp];
    
    self.baseURL = @"http://horseware.resized.co/";
    self.key = @"EBmnyGw5j65p2joAhpNU0pJavIfMd7oG";
}




- (void)testCreation
{
    ResizedService *resizedService = [ResizedService resizedServiceWithServerBaseURL:self.baseURL
                                                                                 key:self.key];
    XCTAssertNotNil(resizedService);
}

@end
