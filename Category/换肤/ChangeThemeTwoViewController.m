//
//  ChangeThemeTwoViewController.m
//  Category
//
//  Created by gaoshan on 2017/9/30.
//  Copyright © 2017年 gaoshan. All rights reserved.
//

#import "ChangeThemeTwoViewController.h"
#import "SkinTool.h"

@interface ChangeThemeTwoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ChangeThemeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self noti1];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti1) name:CHANGETHEME object:nil];
}

-(void)noti1

{
    self.faceImageView.image = [SkinTool skinToolWithImageName:@"face"];
    self.heartImageView.image = [SkinTool skinToolWithImageName:@"heart"];
    self.rectImageView.image = [SkinTool skinToolWithImageName:@"rect"];
    
    self.testLabel.backgroundColor = [SkinTool skinToolWithLabelColor];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
