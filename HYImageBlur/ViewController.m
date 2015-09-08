//
//  ViewController.m
//  HYImageBlur
//
//  Created by heyang on 15/9/8.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //原始图片
    UIImage *image        = [UIImage imageNamed:@"img.jpg"];
    
    //ciimage
    CIImage *ciImage      = [[CIImage alloc]initWithImage:image];
    //ciFiter
    CIFilter *blueFiter   = [CIFilter filterWithName:@"CIGaussianBlur"];
    
    [blueFiter setValue:ciImage forKey:kCIInputImageKey];
    
    
    //打印属性值
    NSLog(@"%@",[blueFiter attributes]);
    
    
    //设置模糊值
    [blueFiter setValue:@(10) forKey:@"inputRadius"];
    
    //将图片输入到滤镜中
    CIImage *outCiImage   = [blueFiter valueForKey:kCIOutputImageKey];
    
    //CIContext
    CIContext *context    = [CIContext contextWithOptions:nil];
    
    
    //获取CGImage句柄
    CGImageRef outCGImage = [context createCGImage:outCiImage fromRect:[outCiImage extent]];
    
    
    //最终获取到图片
    UIImage *blurImage    = [UIImage imageWithCGImage:outCGImage];
    
    //释放  (不支持ARC)
    CGImageRelease(outCGImage);
    
    
    
    _imageView.image      = blurImage;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
