//
//  singleton.h
//  singleton
//
//  Created by gaoshan on 16/8/1.
//  Copyright © 2016年 gaoshan. All rights reserved.
//

/**
 *
 *  实现一个ARC/MRC模式的通用单例
 *
 *  使用说明：1.自定义类.h中引用此头文件并实现宏singleH(name) 2.类.m中实现宏singleM(name)
 */

#define singleH(name) +(instancetype)share##name;

//条件编译 （判断是否是ARC）
#if __has_feature(objc_arc)

#define singleM(name) \
\
static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
    _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
+(instancetype)share##name\
{\
    return [[self alloc] init];\
}\
\
-(id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone\
{\
    return _instance;\
}

#else //MRC模式下

#define singleM(name) \
\
static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
    _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
+(instancetype)share##name\
{\
    return [[self alloc] init];\
}\
\
-(id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone\
{\
    return _instance;\
}\
\
-(oneway void)release\
{\
    \
}\
\
-(instancetype)retain\
{\
    return _instance;\
}\
\
-(NSUInteger)retainCount\
{\
    return MAXFLOAT;\
}

#endif


