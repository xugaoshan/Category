//
//  ChangeThemeViewController.m
//  Category
//
//  Created by gaoshan on 2017/9/30.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import "ChangeThemeViewController.h"
#import "SkinTool.h"

@interface ChangeThemeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;

@end

@implementation ChangeThemeViewController

/*
 问题一:默认进来没有皮肤颜色
 
 问题二:没有记录用户选中皮肤颜色
 
 问题三:和美工沟通的问题
 
 问题四:多个控制器的换肤
 
 问题五:换肤的ImageView不要写在viewDidLoad方法
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeImages];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImages) name:CHANGETHEME object:nil];
    
}
- (IBAction)changeToOrangeSkin {
    [SkinTool setSKinColor:@"orange"];
}

- (IBAction)changeToBlueSkin {
    [SkinTool setSKinColor:@"blue"];
}

- (IBAction)changeToRedSkin {
    [SkinTool setSKinColor:@"red"];
}

- (IBAction)changeToGreenSkin {
    [SkinTool setSKinColor:@"green"];
}

- (void)changeImages
{
    self.faceImageView.image = [SkinTool skinToolWithImageName:@"face"];
    self.heartImageView.image = [SkinTool skinToolWithImageName:@"heart"];
    self.rectImageView.image = [SkinTool skinToolWithImageName:@"rect"];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
