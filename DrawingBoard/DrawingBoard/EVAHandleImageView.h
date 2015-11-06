//
//  EVAHandleImageView.h
//  DrawingBoard
//
//  Created by lyh on 15/11/6.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^EVAHandleImageViewBlock)(UIImage *image);

@interface EVAHandleImageView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) EVAHandleImageViewBlock block;
@end
