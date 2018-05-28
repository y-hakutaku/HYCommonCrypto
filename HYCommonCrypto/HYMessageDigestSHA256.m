//
//  HYMessageDigestSHA256.m
//  HYCommonCrypto
//
//  Created by Hakutaku on 2018/05/28.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

#import "HYMessageDigestSHA256.h"
#import <CommonCrypto/CommonDigest.h>
@interface HYMessageDigestSHA256() {
    CC_SHA256_CTX ctx;
}
@end

@implementation HYMessageDigestSHA256
- (void)setUp {
    CC_SHA256_Init(&ctx);
}

- (BOOL)updateWithData:(NSData *)data {
    if (!data) {
        return NO;
    }
    
    CC_SHA256_Update(&ctx, data.bytes, (CC_LONG)data.length);
    return YES;
}

- (NSString *)digest {
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(digest, &ctx);
    [self setUp];
    
    NSMutableString *hashedString = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH];
    for (int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++) {
        [hashedString appendFormat:@"%02x", digest[i]];
    }
   
    return hashedString;
}
@end
