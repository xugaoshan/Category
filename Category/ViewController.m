//
//  ViewController.m
//  Category
//
//  Created by gaoshan on 2017/9/14.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import "ViewController.h"
#import "Foundation+Tool.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:NSSelectorFromString(@"call123:with1:with2:") withObjects:@[@"1",[NSNull null],@6]];
    
    
    self.strArr = @[@"1",@"呵呵",@1.999];
    NSLog(@"%@",_strArr);
    
    
    NSDictionary *dic = @{@"一":@1.87,@"二":@"哈哈哈",@"三":@[@"145",@"呵呵",@1.9]};
    NSLog(@"%@",dic);
    
    
    NSString *str = @"年末";
    NSLog(@"%@",str);
    
    
}

-(void)call123:(NSString *)a with1:(NSString *)b with2:(NSNumber *)c
{
    NSLog(@"%@ %@ %ld",a,b,[c integerValue]);
}


@end
