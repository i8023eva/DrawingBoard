//
//  EVAPaintView.m
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVAPaintView.h"

@interface EVAPaintView ()

@property (nonatomic, strong) UIBezierPath *path;
//存储路径
@property (nonatomic, strong) NSMutableArray *pathArray;
@end

@implementation EVAPaintView

-(NSMutableArray *)pathArray {
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

- (CGPoint)pointWithTouches:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    [self.pathArray addObject:path];
    
    path.lineWidth = self.value;
    
    CGPoint point = [self pointWithTouches:touches];
    
    [path moveToPoint:point];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [self pointWithTouches:touches];
    
    [self.path addLineToPoint:point];
    
    [self setNeedsDisplay];
}

-(void)awakeFromNib {
    self.value = 1;
}

/**
 *  重绘的时候会清空之前的路径, 需要一个数组来保存
 *
 *  @param rect <#rect description#>
 */
-(void)drawRect:(CGRect)rect {
     [self.pathArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//         [obj setValue:@(self.value)  forKeyPath:@"lineWidth"];  会替换上一次路径的宽度, >不能在这里更改画笔的宽度, 起笔时改
         
         [obj stroke];
     }];
}



@end
