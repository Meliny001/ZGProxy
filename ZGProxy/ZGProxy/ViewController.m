//
//  ViewController.m
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "ViewController.h"
#import "ZGProxy.h"
#import "Dog.h"
#import "Cat.h"

@interface ViewController ()

@property (nonatomic,strong) ZGProxy * proxy;

@end

@implementation ViewController
- (ZGProxy *)proxy
{
    if (!_proxy) {
        _proxy = [ZGProxy alloc];
    }return _proxy;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self transToTargetObj];
}

#pragma mark - 伪多继承
- (void)transToTargetObj
{
    Dog * dog = [Dog new];
    [self.proxy transToObj:dog];
    [self.proxy performSelector:@selector(eat:and:) withObject:@"粑粑"];

    Cat * cat = [Cat new];
    [cat eat:@"Fish"];
    [self.proxy transToObj:cat];
    [self.proxy performSelector:@selector(eat:) withObject:@"Fish"];
}

#pragma mark - 消息机制->reslove->Fast forwarding->Normal Forwarding
- (void)smallTalk
{
    Dog * dog = [Dog new];
    [dog performSelector:NSSelectorFromString(@"dogMissMethod")];
}

#pragma mark - Push
- (IBAction)push:(id)sender
{
    [self.navigationController pushViewController:[NSClassFromString(@"NextViewController") new] animated:YES];
}

@end
