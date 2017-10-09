//
//  SkinTool.m
//  换肤
//
//  Created by xiaomage on 15/8/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "SkinTool.h"

//const 修饰的是常量
NSString *const CHANGETHEME = @"changeTheme";

//用static修饰的全局变量 只能在本文件使用 不管是声明在.h还是.m 都不可以被其他文件使用 所以外面不可以再用extern
static NSString *_skinColor;

@implementation SkinTool


//类的第一个方法调用之前会调用 而load方法是只要被加载就会调用
+ (void)initialize
{
    _skinColor = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
    if (_skinColor == nil) {
        _skinColor = @"blue";
    }
}

+ (BOOL)setSKinColor:(NSString *)skinColor
{
    if (![_skinColor isEqualToString:skinColor]) {//同样颜色不重复保存
    
        _skinColor = skinColor;
        
        // 保存用户设置的皮肤颜色
        [[NSUserDefaults standardUserDefaults] setObject:skinColor forKey:@"skinColor"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:CHANGETHEME object:nil];
        
        return YES;
    }
    return NO;
    
    
}

+ (UIImage *)skinToolWithImageName:(NSString *)imageName
{
    NSString *imagePath = [NSString stringWithFormat:@"skin/%@/%@", _skinColor ,imageName];
    
    return [UIImage imageNamed:imagePath];
}

+ (UIColor *)skinToolWithLabelColor
{
    // 1.获取plist的路径
    NSString *plistName = [NSString stringWithFormat:@"skin/%@/bgColor.plist", _skinColor];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    
    // 2.读取颜色的点击
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    // 3.读取对应颜色的字符串
    NSString *colorString = colorDict[@"labelBgColor"];
    
    // 4.获取颜色数组
    NSArray *colorArray = [colorString componentsSeparatedByString:@","];
    
    // 5.读取对应RGB
    NSInteger red = [colorArray[0] integerValue];
    NSInteger green = [colorArray[1] integerValue];
    NSInteger blue = [colorArray[2] integerValue];
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
