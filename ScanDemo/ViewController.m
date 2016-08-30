//
//  ViewController.m
//  ScanDemo
//
//  Created by 王傲 on 16/8/29.
//  Copyright © 2016年 Hello. All rights reserved.
//

#import "ViewController.h"
#import "ScanView.h"

@interface ViewController ()
{
    ScanView *scanView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    scanView= [[ScanView alloc] initDefalut];
    [self.view addSubview:scanView];
    [scanView startScanWithCompletion:^(NSString *url) {

    }];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
