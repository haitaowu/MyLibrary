//
//  UIView+Ext.m
//  NetDemo
//
//  Created by taotao on 15/3/12.
//  Copyright (c) 2015年 taotao. All rights reserved.
//

#import "UIView+Ext.h"

@implementation UIView (Ext)
#pragma mark - setter method
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint aCenter = self.center;
    aCenter.x = centerX;
    self.center = aCenter;
}
- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint aCenter = self.center;
    aCenter.y = centerY;
    self.center = aCenter;
}
- (CGFloat)centerY
{
    return self.center.y;
}


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y
{
    return self.frame.origin.y;

}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height
{
    return self.frame.size.height;

}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size
{
    return self.frame.size;
}



/**
 add corner radius
 */
- (void)addCorner:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}


//masksToBounds = YES 会同时切掉shadow的相关设置

/**
 add corner radius and shadow
 */
- (void)addCorner:(CGFloat)radius shadow:(UIColor*)color
{
    [self addCorner:radius];
//    [self addShadowColor:color];
    
    [self.superview.layer insertSublayer:[self shadowLayerWithRadius:radius] below:self.layer];
//    [self.layer addSublayer:[self shadowLayerWithRadius:radius]];
//    [self.layer insertSublayer:[self shadowLayerWithRadius:radius] atIndex:0];
}

- (CALayer*)shadowLayerWithRadius:(CGFloat)radius
{
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = self.layer.frame;
//    shadowLayer.frame = CGRectMake(100, 100, 100, 100);
    //这个背景色要设置，否则layer对象的阴影不显示。
    shadowLayer.backgroundColor = [UIColor whiteColor].CGColor;
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowOpacity = 0.8;
    shadowLayer.shadowOffset = CGSizeMake(2, 3);
    shadowLayer.shadowRadius = 2;
    shadowLayer.cornerRadius = radius;
    return shadowLayer;
}


/**
 *隐藏键盘手势
 */
- (void)addDismissKeyboardGesture
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissViewKeyboard)];
    [self addGestureRecognizer:tapGesture];
}


- (void)dismissViewKeyboard
{
    [self endEditing:YES];
}


/**
 根据弧度 、半径、中心点坐标来计算坐标
 @param radian 弧度
 @param center 圆点坐标
 @param radius 半径
 */
- (CGPoint)pointByRadian:(CGFloat)radian center:(CGPoint)center radius:(CGFloat)radius
{
    float x = center.x + cos(radian)*radius;
    float y = center.y + sin(radian)*radius;
    CGPoint point = CGPointMake(x, y);
    return point;
}

/**
 四个角中的指定的角添加圆角
 */
- (void)addCornerRadius:(CGFloat)radius toCorners:(UIRectCorner)corners
{
    CGSize radii = CGSizeMake(radius, radius);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    self.layer.mask = shape;
}


/**
 给view添加阴影
 */
- (void)addShadowColor:(UIColor*)color
{
    if (color == nil) {
        color = [UIColor grayColor];
    }
    self.layer.shadowColor = [color CGColor];
    self.layer.shadowOffset = CGSizeMake(3, 3);
    self.layer.shadowOpacity = 0.8;
}



/**
 add border with color
 */
- (void)addBorder:(CGFloat)weight color:(UIColor*)color
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = weight;
}

@end
