//
//  ZJReachability.h
//  MaxDiary
//
//  Created by max on 2019/2/28.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Reachability.h"

/** 警告视图在持续1.5秒后消失 **/
#define ZJAlertViewDuration 1.5

/** 定义网络状态 **/
typedef NS_ENUM(NSInteger, ZJNetWorkStatus) {
    ZJNetWorkStatusNotReachable=0,
    ZJNetWorkStatus2G,
    ZJNetWorkStatusEdge,
    ZJNetWorkStatus3G,
    ZJNetWorkStatus4G,
    ZJNetWorkStatusWifi,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZJReachability : NSObject

@property(nonatomic,strong)Reachability *reachability;

/** 判断网络是否可用 */
+ (ZJNetWorkStatus)networkStatus;

@end

NS_ASSUME_NONNULL_END
