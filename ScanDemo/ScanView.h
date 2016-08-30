//
//  ScanView.h
//  ScanDemo
//
//  Created by 王傲 on 16/8/30.
//  Copyright © 2016年 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanView : UIView
- (instancetype)initDefalut;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)startScanWithCompletion:(void (^)(NSString *url))completion;

@end
