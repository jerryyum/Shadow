//
//  ShapeView.m
//  Shadow
//
//  Created by chianyu on 2019/1/25.
//  Copyright © 2019年 chianyu. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        self.layer.shadowRadius = 10.f;
        self.layer.shadowOffset = CGSizeMake(0.f, 0.f);
        self.layer.shadowOpacity = 1.f;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.bounds.size];
    ((CAShapeLayer *)self.layer).path = maskPath.CGPath;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    ((CAShapeLayer *)self.layer).fillColor = backgroundColor.CGColor;
}

@end
