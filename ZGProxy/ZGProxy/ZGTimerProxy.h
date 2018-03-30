//
//  ZGTimerProxy.h
//  ZGProxy
//
//  Created by Magic on 2018/3/30.
//  Copyright © 2018年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGTimerProxy : NSProxy

@property (nonatomic,weak) id delegate;

@end
