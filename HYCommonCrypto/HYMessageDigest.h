//
//  HYMessageDigest.h
//  HYCommonCrypto
//
//  Created by Hakutaku on 2018/05/28.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,HYMessageDigestType) {
    SHA256,
    SHA512
};

@class HYMessageDigest;
@interface HYMessageDigest<HYMessageDigestSubClazz:HYMessageDigest *> : NSObject
+ (nullable HYMessageDigestSubClazz)getInstanceWithType:(HYMessageDigestType)type;
- (void)setUp;
- (BOOL)updateWithData:(NSData *)data;
- (NSString *)digest;
@end
NS_ASSUME_NONNULL_END
