//
//  ZGTimerProxy.m
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "ZGTimerProxy.h"

@implementation ZGTimerProxy

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if ([self.delegate respondsToSelector:sel]) {
        return [self.delegate methodSignatureForSelector:sel];
    }return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self.delegate respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.delegate];
    }
}

@end
