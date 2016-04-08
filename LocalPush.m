//
//  LocalPush.m
//  myOwn
//
//  Created by myOwn on 16/4/8.
//  Copyright © 2016年 myOwn. All rights reserved.
//

#import "LocalPush.h"

@implementation LocalPush


+ (void)registerLocalNotification:(NSInteger)alertTime withNote:(NSString *)note{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置出发时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:alertTime];
    notification.fireDate = fireDate;
    //设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitDay;
    //时区
    notification.timeZone = [NSTimeZone defaultTimeZone];

    //通知内容
    notification.alertBody = @"该吃药了！！！该吃药了！！！该吃药了！！！";
    notification.applicationIconBadgeNumber = 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    //通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:note forKey:@"key"];
    notification.userInfo = userDict;
    
    //iOS8后,需要添加注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        //通知重复提示的单位，可以是天，周，日
        notification.repeatInterval  = NSCalendarUnitDay;
        
    }else{
        notification.repeatInterval = NSCalendarUnitDay;
    }
    //执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

+ (void)cancelLocalNotificationWithKey:(NSString *)key{
    //获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            NSString *info = userInfo[@"key"];
            if ([key isEqualToString:info]) {
                [[UIApplication sharedApplication]cancelLocalNotification:notification];
            }
//            if (info != nil) {
//                [[UIApplication sharedApplication] cancelLocalNotification:notification];
//                break;
//            }
        }
    }
}


@end
