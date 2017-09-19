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
    
    
    NSLog(@"%@",[@"/Users/gaoshan/Desktop/学习资料/15 - 环信项目/1231视频/1231装逼特技/资料/素材/plugin.png" MIMEType]);
    
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    
}

-(void)call123:(NSString *)a with1:(NSString *)b with2:(NSNumber *)c
{
    NSLog(@"%@ %@ %ld",a,b,[c integerValue]);
}


@end
