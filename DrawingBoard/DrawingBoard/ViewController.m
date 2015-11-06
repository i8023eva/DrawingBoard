//
//  ViewController.m
//  DrawingBoard
//
//  Created by lyh on 15/11/5.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ViewController.h"
#import "EVAPaintView.h"
#import "MBProgressHUD+MJ.h"
#import "EVAHandleImageView.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet EVAPaintView *paintView;

@end

@implementation ViewController

- (IBAction)save:(UIBarButtonItem *)sender {
    //保存图片---截屏
    UIGraphicsBeginImageContextWithOptions(self.paintView.bounds.size, NO, 0.f);
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //画板上的内容渲染到上下文
    [self.paintView.layer renderInContext:ref];
    //获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
// Adds a photo to the saved photos album.  The optional completionSelector should have the form:
//  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {//保存失败
        [MBProgressHUD showError:@"保存失败"];
    }else {//保存成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}

#pragma mark - 用户相册
- (IBAction)selectPhoto:(UIBarButtonItem *)sender {
    //照片选择器
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    //数据源  ---用户相册  UIImagePickerControllerSourceTypePhotoLibrary
    //  ---相册列表  UIImagePickerControllerSourceTypeSavedPhotosAlbum
    //  ---照相机  UIImagePickerControllerSourceTypeCamera
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    /**
    info {
     UIImagePickerControllerMediaType = "public.image";
     UIImagePickerControllerOriginalImage = "<UIImage: 0x7fc4f5870440> size {3000, 2002} orientation 0 scale 1.000000";
     UIImagePickerControllerReferenceURL = "assets-library://asset/asset.JPG?id=45EC6936-8F0D-4FA7-B9F6-691A995AE25E&ext=JPG";
     }
     */
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    EVAHandleImageView *imageView = [[EVAHandleImageView alloc]initWithFrame:self.paintView.frame];
    
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
//    self.paintView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    NSLog(@"%@", info);
}



- (IBAction)eraser:(UIBarButtonItem *)sender {
    self.paintView.color = [UIColor colorWithWhite:0.902 alpha:1.000];
}

- (IBAction)undo:(UIBarButtonItem *)sender {
    [self.paintView undo];
}

- (IBAction)clearScreen:(UIBarButtonItem *)sender {
    [self.paintView clearScreen];
}

- (IBAction)didClickForChangeColor:(UIButton *)sender {
    self.paintView.color = sender.backgroundColor;
}


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
