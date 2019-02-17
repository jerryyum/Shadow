//
//  ViewController.m
//  Shadow
//
//  Created by chianyu on 2019/1/25.
//  Copyright © 2019年 chianyu. All rights reserved.
//

#import "ViewController.h"
#import "ShapeView.h"

#define kTag 1000

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGPoint center = self.view.center;
    
    UIView *shapeView = [self.view viewWithTag:kTag];
    shapeView.center = CGPointMake(center.x, center.y - 80);
    
    UIView *shadowView = [self.view viewWithTag:kTag + 1];
    shadowView.center = CGPointMake(center.x, center.y + 80);
}

- (void)setupViews {
    // shapeView
    ShapeView *shapeView = [[ShapeView alloc] init];
    shapeView.frame = CGRectMake(0, 0, 100, 100);
    shapeView.backgroundColor = [UIColor cyanColor];
    shapeView.tag = kTag;
    [self.view addSubview:shapeView];
    
    // 对于UIImageView，无法对图片切圆角，只能使用ShapeView
    // shadowView
    UIView *shadowView = [[UIView alloc] init];
    shadowView.frame = CGRectMake(0, 0, 100, 100);
    shadowView.backgroundColor = [UIColor greenColor];
    //shadowView.backgroundColor = shapeView.backgroundColor;//?
    shadowView.layer.cornerRadius = 50;
    shadowView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(0, 0);
    shadowView.layer.shadowOpacity = 0.9;
    shadowView.layer.shadowRadius = 10;
    shadowView.tag = kTag + 1;
    [self.view addSubview:shadowView];
}

@end
