//
//  HYMessageDigestSHA512.m
//  HYCommonCrypto
//
//  Created by Hakutaku on 2018/05/28.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

#import "HYMessageDigestSHA512.h"
#import <CommonCrypto/CommonCrypto.h>

@interface HYMessageDigestSHA512() {
    CC_SHA512_CTX ctx;
}
@end

@implementation HYMessageDigestSHA512
- (void)setUp {
    CC_SHA512_Init(&ctx);
}

- (BOOL)updateWithData:(NSData *)data {
    if (!data) {
        return NO;
    }
    
    CC_SHA512_Update(&ctx, data.bytes, (CC_LONG)data.length);
    return YES;
}

- (NSString *)digest {
    const char digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Update(&ctx, digest, CC_SHA512_DIGEST_LENGTH);
    
    [self setUp];
    NSMutableString *hashedString = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH];
    for (int i = 0; i<CC_SHA512_DIGEST_LENGTH; i++) {
        [hashedString appendFormat:@"%02x", digest[i]];
    }
    
    return [hashedString copy];
}
@end
