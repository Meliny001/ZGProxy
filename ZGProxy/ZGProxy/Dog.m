//
//  Dog.m
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "Dog.h"
#import <objc/message.h>
#import "ZGProxy.h"

@interface Dog()

@property (nonatomic,strong) ZGProxy * proxy;

@end

@implementation Dog

- (ZGProxy *)proxy
{
    if (!_proxy) {
        _proxy = [ZGProxy alloc];
    }return _proxy;
}

- (void)eat:(NSString *)something and:(NSString *)otherStr
{
    ZGLog(@"%@-%@",something,otherStr);
}

#pragma mark - ResolveMethod
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    // run:and:
    ZGLog(@"%@",NSStringFromSelector(sel));
    if (sel == NSSelectorFromString(@"run:")) {
        class_addMethod([self class], sel, (IMP)run, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void run(id obj,SEL _cmd,id arg)
{
    ZGLog(@"%@",arg);
}

#pragma mark - FastForwarding/dogMissMethod
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    ZGLog(@"");
    if (aSelector == NSSelectorFromString(@"dogMissMethod")) {
        return self.proxy;
    }return [super forwardingTargetForSelector:aSelector];
}


@end
