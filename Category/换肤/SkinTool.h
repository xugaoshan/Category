//
//  SkinTool.h
//  换肤
//
//  Created by xiaomage on 15/8/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

//一旦改变皮肤 就会发出这个名称的消息
UIKIT_EXTERN NSString *const CHANGETHEME;

@interface SkinTool : NSObject

+ (BOOL)setSKinColor:(NSString *)skinColor;

+ (UIImage *)skinToolWithImageName:(NSString *)imageName;

+ (UIColor *)skinToolWithLabelColor;

@end
