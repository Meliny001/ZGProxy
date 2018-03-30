//
//  ZGProxy.h
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGProxy : NSProxy
- (void)proxyTransformToTarget:(__nonnull id)obj;
- (void)proxyTransformToTarget:(__nonnull id)obj performSelector:(SEL __nonnull )selector withParameter:(__nullable id)parameter;
- (void)proxyTransformToTarget:(__nonnull id)obj performSelString:(NSString * __nonnull)selStr withParameter:(__nullable id)parameter;
@end
