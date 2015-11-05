//
//  ViewController.m
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ViewController.h"
#import "EVAPaintView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet EVAPaintView *paintView;

@end

@implementation ViewController
- (IBAction)valueChange:(UISlider *)sender {
    self.paintView.value = sender.value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
