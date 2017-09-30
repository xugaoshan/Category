//
//  Button_Block.h
//  Category
//
//  Created by gaoshan on 2017/9/20.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Button_Block;
typedef void(^ButtonClickBlock)(Button_Block *);

@interface Button_Block : UIButton

/** 点击回调 */
@property (nonatomic, copy) ButtonClickBlock block;

+ (instancetype)createButton;

@end
