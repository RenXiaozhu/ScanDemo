//
//  AppDelegate.h
//  ScanDemo
//
//  Created by 王傲 on 16/8/29.
//  Copyright © 2016年 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

