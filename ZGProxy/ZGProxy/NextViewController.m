//
//  NextViewController.m
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "NextViewController.h"
#import "ZGTimerProxy.h"

@interface NextViewController ()

@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,strong) ZGTimerProxy *proxy;

@end

@implementation NextViewController
- (ZGTimerProxy *)proxy
{
    if (!_proxy) {
        _proxy = [ZGTimerProxy alloc];
        _proxy.delegate = self;
    }return _proxy;
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.proxy selector:@selector(start) userInfo:nil repeats:YES];
    }return _timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self addTimerAndStart];
}
- (void)addTimerAndStart
{
    if (self.timer.isValid == NO) {
        [self.timer fire];
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}
- (void)start{
    ZGLog(@"");
}
@end
