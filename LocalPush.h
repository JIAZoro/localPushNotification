//
//  LocalPush.h
//  myOwn
//
//  Created by myOwn on 16/4/8.
//  Copyright © 2016年 myOwn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalPush : UIView
+ (void)registerLocalNotification:(NSInteger)alertTime withNote:(NSString *)note;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;
@end
