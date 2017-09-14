//
//  Foundation+Tool.h
//  所有的Category
//
//  Created by gaoshan on 2017/9/14.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import <Foundation/Foundation.h>

/*--------------------<NSObject Category>---------------------*/

@interface NSObject (Tool)

#pragma mark - <TargetAction>

/**
 * 给任意的类传递无限多个值  其中比较适用于UIcontrol类的Target-action监听方法传值(因为监听方法会把此UIcontrol类带过来)
 */

//-(void)setMe:(NSDictionary *)me;
//-(id)me;

@property(nonatomic, retain)NSDictionary *me;


#pragma mark - <PerformSelector>

/**
 * PerformSelector方法多参数
 */
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;


#pragma mark - <NSObject Log>

@end




/*--------------------<NSString Category>---------------------*/

@interface NSString (Tool)

#pragma mark - <把字符串中的中文编码转成中文>


#pragma mark - <获得某个路径下文件的MIMEType>
- (NSString *)MIMEType;

@end



/*--------------------<NSDictionary Category>---------------------*/

@interface NSDictionary (Tool)

#pragma mark - <字典输出中文>

@end




/*--------------------<NSArray Category>---------------------*/

@interface NSArray (Tool)

#pragma mark - <数组输出中文>

@end

























