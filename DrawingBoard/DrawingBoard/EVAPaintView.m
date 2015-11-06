//
//  EVAPaintView.m
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVAPaintView.h"
#import "EVABezierPath.h"

@interface EVAPaintView ()

@property (nonatomic, strong) UIBezierPath *path;
//存储路径
@property (nonatomic, strong) NSMutableArray *pathArray;
@end

@implementation EVAPaintView

-(void)setImage:(UIImage *)image {
    _image = image;
}

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
    EVABezierPath *path = [EVABezierPath bezierPath];
    self.path = path;
    [self.pathArray addObject:path];
    
    path.lineWidth = self.value;
    path.color = self.color;
    
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
    //如果数组清零
    if (!self.pathArray.count) return;
    
     [self.pathArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//         [obj setValue:@(self.value)  forKeyPath:@"lineWidth"];  会替换上一次路径的宽度, >不能在这里更改画笔的宽度, 起笔时改
         
         if ([obj isKindOfClass:[UIImage class]]) {
             UIImage *image = obj;
             [image drawAtPoint:CGPointZero];
         }

         UIColor *color = [obj valueForKeyPath:@"color"];
         [color set];
//         [(UIColor *)[obj valueForKeyPath:@"color"] performSelector:@selector(set)];
         
         [obj stroke];
     }];
}

-(void)clearScreen {
    [self.pathArray removeAllObjects];
    
    [self setNeedsDisplay];
}

-(void)undo {
    [self.pathArray removeLastObject];
    
    [self setNeedsDisplay];
}



@end
