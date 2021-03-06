//
//  EVAPaintView.h
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVAPaintView : UIView
@property (nonatomic, assign) CGFloat value;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIImage *image;

-(void) clearScreen;
-(void) undo;
@end
