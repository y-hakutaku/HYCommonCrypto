//
//  HYMessageDigest.m
//  HYCommonCrypto
//
//  Created by Hakutaku on 2018/05/28.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

#import "HYMessageDigest.h"
#import "HYMessageDigestSHA256.h"
#import "HYMessageDigestSHA512.h"
@implementation HYMessageDigest
+ (__kindof HYMessageDigest* _Nullable)getInstanceWithType:(HYMessageDigestType)type {
    switch (type) {
        case SHA256:
            return [HYMessageDigestSHA256 new];
        case SHA512:
            return [HYMessageDigestSHA512 new];
        default:
            return nil;
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp {
    //abstract
}

- (BOOL)updateWithData:(NSData *)data {
    return nil;
}

- (NSString *)digest {
    return nil;
}
@end
