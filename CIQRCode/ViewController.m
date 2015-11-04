//
//  ViewController.m
//  CIQRCode
//
//  Created by ios－08 on 15/9/22.
//  Copyright (c) 2015年 ios－08. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //reset
    [filter setDefaults];
    
    //3.
    NSData *data = [@"http://www.baidu.com" dataUsingEncoding:NSUTF8StringEncoding];
    
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    UIImage *qrImage = [UIImage imageWithCIImage:outputImage scale:2 orientation:UIImageOrientationUp];
    
//    self.qrImageView.image = qrImage;
    
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0.0);
    
    [qrImage drawInRect:CGRectMake(0, 0, 100, 100)];
    
    UIImage *maskImage = [UIImage imageNamed:@"mask"];
    [maskImage drawInRect:CGRectMake(40, 40, 20, 20)];
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.qrImageView.image = finalImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
