//
//  ViewController.m
//  CaptureView
//
//  Created by ppzc on 16/8/12.
//  Copyright © 2016年 ppzc. All rights reserved.
//
#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    UILabel *label = [UILabel new];
    [label setFrame:CGRectMake(100, 200, 100, 100)];
    [label setBackgroundColor:[UIColor redColor]];
    [label setText:@"111111111111111111111"];
    
    [self.view addSubview:label];
    
    UIImage *captureImage = [self imageFromView:self.view];
    UIImage *smallImage = [self rescaleImage:captureImage ToSize:CGSizeMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH / 4, SCREEN_HEIGHT / 4)];
    [imageView setImage:smallImage];
    
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImage *) imageFromView: (UIView *)theView {
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)rescaleImage:(UIImage *)img ToSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    [img drawInRect:rect]; // scales image to rect
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}

@end
