
//
//  HYCommonCryptoTests.m
//  HYCommonCryptoTests
//
//  Created by Hakutaku on 2018/05/28.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HYMessageDigest.h"
#import "HYMessageDigestSHA256.h"
#import "HYMessageDigestSHA512.h"
@interface HYMessageDigestSHA256Tests : XCTestCase
@property (nonatomic)HYMessageDigestSHA256 *mdSha256;
@property (nonatomic)HYMessageDigestSHA512 *mdSha512;
@end

@implementation HYMessageDigestSHA256Tests

- (void)setUp {
    self.mdSha256 = [HYMessageDigest getInstanceWithType:SHA256];
    self.mdSha512 = [HYMessageDigest getInstanceWithType:SHA512];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHash256 {
    XCTAssertTrue([self.mdSha256 updateWithData:[@"ui" dataUsingEncoding:NSUTF8StringEncoding]]);
    NSString *hashedString = [self.mdSha256 digest];
    XCTAssertNotNil(hashedString);
    XCTAssertEqual(hashedString.length, 64);
}

- (void)testHash512 {
    XCTAssertTrue([self.mdSha512 updateWithData:[@"ui" dataUsingEncoding:NSUTF8StringEncoding]]);
    NSString *hashedString = [self.mdSha512 digest];
    XCTAssertNotNil(hashedString);
    XCTAssertEqual(hashedString.length, 128);
}

@end
