//
//  ScanUI.h
//  ScanDemo
//
//  Created by 王傲 on 16/8/30.
//  Copyright © 2016年 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanUI : UIView

- (instancetype)initDefault;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)startScanAnimationWithCompletion:(void (^)(void))completion;
- (void)stopScanAnimationWithCompletion:(void (^)(void))completion;
@end
