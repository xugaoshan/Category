//
//  Button_Block.m
//  Category
//
//  Created by gaoshan on 2017/9/20.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import "Button_Block.h"

@implementation Button_Block

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)click:(Button_Block *)btn
{
    if (_block) {
        _block(btn);
    }
}

+ (instancetype)createButton
{
    return [Button_Block buttonWithType:UIButtonTypeCustom];
}


@end
