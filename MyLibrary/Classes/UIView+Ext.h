//
//  UIView+Ext.h
//  NetDemo
//
//  Created by taotao on 15/3/12.
//  Copyright (c) 2015年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Ext)
@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat centerX;
@property (nonatomic,assign)CGFloat centerY;
@property (nonatomic,assign)CGFloat y;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGSize size;

/**
 add corner radius
 */
- (void)addCorner:(CGFloat)radius;

/**
 add corner radius and shadow
 */
- (void)addCorner:(CGFloat)radius shadow:(UIColor*)color;


/**
 *隐藏键盘手势
 */
- (void)addDismissKeyboardGesture;

/**
 根据弧度 、半径、中心点坐标来计算坐标
 @param radian 弧度
 @param center 圆点坐标
 @param radius 半径
 */
- (CGPoint)pointByRadian:(CGFloat)radian center:(CGPoint)center radius:(CGFloat)radius;

/**
 四个角中的指定的角添加圆角
 */
- (void)addCornerRadius:(CGFloat)radius toCorners:(UIRectCorner)corners;

/**
 给view添加阴影
 */
- (void)addShadowColor:(UIColor*)color;

/**
 add border with color
 */
- (void)addBorder:(CGFloat)weight color:(UIColor*)color;


@end
