//
//  EVABezierPath.h
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVABezierPath : UIBezierPath

@property (nonatomic, strong) UIColor *color;

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP;
@end
