//
//  ZGProxy.m
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "ZGProxy.h"

@interface ZGProxy()

@property (nonatomic,strong) NSObject * obj;

@end

@implementation ZGProxy

#pragma mark - 消息转发到指定实例[多继承]
- (void)transToObj:(id)obj
{
    self.obj = obj;
}
// 2.调用实现
- (void)forwardInvocation:(NSInvocation *)invocation
{
    if (self.obj) {
        // 拦截执行者
        [invocation setTarget:self.obj];
        // 拦截方法
        if ([self.obj isKindOfClass:NSClassFromString(@"Dog")]) {
            NSString * str = @"狗屎";
            // [应用]更换方法
            [invocation setSelector:NSSelectorFromString(@"run:")];
            [invocation setArgument:&str atIndex:2];
        }
        // 执行
        [invocation invoke];
    }
}

// 1.返回方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if ([self.obj respondsToSelector:sel]) {
        return [self.obj methodSignatureForSelector:sel];
    }
    return [super methodSignatureForSelector:sel];
}


#pragma mark - Fast forwarding
- (void)dogMissMethod
{
    ZGLog(@"");
}



@end
