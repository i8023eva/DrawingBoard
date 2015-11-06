//
//  EVAHandleImageView.m
//  DrawingBoard
//
//  Created by lyh on 15/11/6.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVAHandleImageView.h"
#import "UIImage+Tool.h"

@interface EVAHandleImageView ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation EVAHandleImageView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubView];
        
        [self addGestureRecognizer];
    }
    return self;
}

-(void) addGestureRecognizer {
    //长按手势 ---将视图添加到画板上
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    
}

-(void) longPress: (UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            self.imageView.alpha = 0.3;//闪烁
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.imageView.alpha = 1.f;
            } completion:^(BOOL finished) {
                //截屏
                UIImage *newImage = [UIImage imageWithCaptureView:self];
                //图片传给控制器
                
                //移除自身
                
            }];
        }];
    }
}

-(void) setupSubView {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:imageView];
    self.imageView = imageView;
}

-(void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = _image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
