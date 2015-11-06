//
//  EVABezierPath.m
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVABezierPath.h"

@implementation EVABezierPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP {
    EVABezierPath *path = [[self alloc] init];
    path.lineWidth = width;
    path.color = color;
    [path moveToPoint:startP];
    
    return path;
}
@end
