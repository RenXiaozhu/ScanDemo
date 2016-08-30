//
//  ScanView.m
//  ScanDemo
//
//  Created by 王傲 on 16/8/30.
//  Copyright © 2016年 Hello. All rights reserved.
//

#import "ScanView.h"
#import <AVFoundation/AVFoundation.h>
#import "ScanUI.h"

typedef void (^FinishBlock)(NSString *url);

@interface ScanView ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession *session;
    ScanUI *scanUI;
}
@property (nonatomic, copy) FinishBlock finish;
@end

@implementation ScanView

- (instancetype)initDefalut
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
    {
        [self setOpaque:NO];

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {

    }
    return self;
}

- (ScanUI *)scanUI
{
    if (scanUI == nil)
    {
        scanUI = [[ScanUI alloc] initDefault];
        [self addSubview:scanUI];
    }
    return scanUI;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUIConfig];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
}


- (void)startScanWithCompletion:(void (^)(NSString *url))completion
{
    if (self.finish)
    {
        self.finish = nil;
        self.finish = completion;
    }
}


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count>0) {

        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];

        self.finish(metadataObject.stringValue);

        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);

        [session stopRunning];
        
    }
}

- (void)setupUIConfig
{
    for (UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
    // 初始化视频采集设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 初始化视频输入
    AVCaptureDeviceInput  *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];

    // 初始化二维码扫描输出
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

    session = [[AVCaptureSession alloc] init];
    // 设置高采样率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    [session addInput:input];
    [session addOutput:output];
    [session startRunning];

    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];



    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.bounds;
    //    [self.view addSubview:effectView];

    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.layer.bounds;
    [self.layer insertSublayer:layer atIndex:0];

    [self->scanUI setFrame:self.bounds];
    [self->scanUI setNeedsLayout];

}


- (void)dealloc
{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
