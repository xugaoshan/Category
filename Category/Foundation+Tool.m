//
//  Foundation+Tool.m
//  所有的Category
//
//  Created by gaoshan on 2017/9/14.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import "Foundation+Tool.h"
#import <objc/runtime.h>
#import <MobileCoreServices/MobileCoreServices.h>


/*--------------------<NSObject Category>---------------------*/

@implementation NSObject (Tool)

#pragma mark - <TargetAction>

-(void)setMe:(NSDictionary *)me
{
    objc_setAssociatedObject(self,@"me",me,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(id)me
{
    return objc_getAssociatedObject(self,@"me");
}


#pragma mark - <PerformSelector>

- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    // 方法签名(方法的描述)
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        //        @throw [NSException exceptionWithName:@"牛逼的错误" reason:@"方法找不到" userInfo:nil];
        [NSException raise:@"牛逼的错误" format:@"%@方法找不到", NSStringFromSelector(selector)];
    }
    
    // NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    // 调用方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength) { // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}


#pragma mark - <Log>

#ifdef DEBUG
//debugDescription 这个方法是控制在控制台po的时候 打印的格式
- (NSString *)debugDescription
{
    id modelClass = [self class];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(modelClass, &outCount);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:outCount];
    
    //遍历出所有的属性key/value
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [[self valueForKey:propName] description]?:[NSNull null];
        [dict setObject:value forKey:propName];
    }
    
    //释放
    free(properties);
    
    return [NSString stringWithFormat:@"<%@: %p>\n属性名<--->值\n%@", NSStringFromClass([self class]), self, dict];
}
#endif

@end




/*--------------------<NSString Category>---------------------*/

@implementation NSString (Tool)

#pragma mark - <把字符串中的中文编码转成中文>

- (NSString *)unicodeString
{
    
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSPropertyListFormat format = NSPropertyListOpenStepFormat;
    
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:&format error:nil];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

#pragma mark - <获得某个路径下文件的MIMEType>

- (NSString *)MIMEType
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self]) {
        return nil;
    }
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge  CFStringRef)[self pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)MIMEType;
}

@end




/*--------------------<NSDictionary Category>---------------------*/

@implementation NSDictionary (Tool)

#pragma mark - <字典输出中文>

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(id)locale
{
    //    NSMutableString *string = [NSMutableString string];
    //
    //    // 开头有个{
    //    [string appendString:@"{\n"];
    //
    //    // 遍历所有的键值对
    //    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    //        [string appendFormat:@"\t%@", key];
    //        [string appendString:@" : "];
    //        if ([obj isKindOfClass:[NSNumber class]]) {
    //            [string appendFormat:@"@%@,\n", obj];
    //        } else {
    //            [string appendFormat:@"%@,\n", obj];
    //        }
    //    }];
    //
    //    // 结尾有个}
    //    [string appendString:@"}"];
    //
    //    // 查找最后一个逗号
    //    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    //    if (range.location != NSNotFound)
    //        [string deleteCharactersInRange:range];
    //
    //    return string;
    
    return self.debugDescription;
}

- (NSString *)debugDescription
{
    return self.description.unicodeString;
}
#endif

@end




/*--------------------<NSArray Category>---------------------*/

@implementation NSArray (Tool)

#pragma mark - <数组输出中文>

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(id)locale
{
    //    NSMutableString *string = [NSMutableString string];
    //
    //    // 开头有个[
    //    [string appendString:@"[\n"];
    //
    //    // 遍历所有的元素
    //    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //        if ([obj isKindOfClass:[NSNumber class]]) {
    //            [string appendFormat:@"\t@%@,\n", obj];
    //        } else {
    //            [string appendFormat:@"\t%@,\n", obj];
    //        }
    //    }];
    //
    //    // 结尾有个]
    //    [string appendString:@"]"];
    //
    //    // 查找最后一个逗号
    //    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    //    if (range.location != NSNotFound)
    //        [string deleteCharactersInRange:range];
    //    
    //    return string;
    
    
    return self.debugDescription;
}

- (NSString *)debugDescription
{
    return self.description.unicodeString;
}
#endif

@end


