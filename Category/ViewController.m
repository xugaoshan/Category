//
//  ViewController.m
//  Category
//
//  Created by gaoshan on 2017/9/14.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import "ViewController.h"
#import "Foundation+Tool.h"

//#define k_nsef 0

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:NSSelectorFromString(@"call123:with1:with2:") withObjects:@[@"1",[NSNull null],@6]];
    
    
    self.strArr = @[@"1",@"呵呵32323",@1.999];
    NSLog(@"%@",_strArr);

    
    NSDictionary *dic = @{@"一":@1.87,@"二":@"哈哈哈",@"三":@[@"145",@"呵呵",@1.9]};
    NSLog(@"%@",dic);
    
    
    NSLog(@"%@",[@"/Users/gaoshan/Desktop/学习资料/15 - 环信项目/1231视频/1231装逼特技/资料/素材/plugin.png" MIMEType]);

    
//    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
    
    
    NSString *str = @"134";
    NSUInteger a = 2;
    NSUInteger result = [str length] ?: a;
    NSLog(@"%lu",(unsigned long)result);
    
    
    NSLog(@"---%@",[NSURL fileURLWithPath:[self getVideoMergeFilePathString]]);
    
    
    
    // ifdef不判断真假  elif可以和ifdef或者ifndef一块使用 无论何时elif都会判断真假
    #ifdef k_nsef
    NSLog(@"===2");
    #elif 3<2
    NSLog(@"===3");
    #else
    NSLog(@"===4");
    #endif
    
    
    
    NSString *s = @"wefwegrwefg";
    NSMutableArray *array = (NSMutableArray *)[s componentsSeparatedByString:@"r"];
    NSLog(@"%lu",(unsigned long)array.count);
    NSLog(@"%@",array);
    
    for (int i = 0; i < array.count; i++)
    {
        NSArray *array1 = [array[i] componentsSeparatedByString:@"f"];
        [array replaceObjectAtIndex:i withObject:array1];
    }
    NSLog(@"%@",array);
    
    NSMutableArray *array1 = [NSMutableArray new];
    NSLog(@"%lu",(unsigned long)array1.count);
    
    
    
    [self test];
}

-(void)call123:(NSString *)a with1:(NSString *)b with2:(NSNumber *)c
{
    NSLog(@"%@ %@ %ld",a,b,[c integerValue]);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


- (NSString *)getVideoMergeFilePathString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"videos"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *nowTimeStr = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
    
    NSString *fileName = [[path stringByAppendingPathComponent:nowTimeStr] stringByAppendingString:@".mp4"];
    
    return fileName;
}

-(void)test
{
//    // 问题：以下代码是在主线程执行的，会不会产生死锁？会！
//    NSLog(@"执行任务1");
//
//    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{ // 0
//        NSLog(@"执行任务2");
//
//        dispatch_sync(queue, ^{ // 1
//            NSLog(@"执行任务3");
//        });
//
//        NSLog(@"执行任务4");
//    });
//
//    NSLog(@"执行任务5");
}

@end
