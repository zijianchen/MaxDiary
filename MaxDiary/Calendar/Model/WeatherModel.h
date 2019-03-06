//
//  WeatherModel.h
//  MaxDiary
//
//  Created by max on 2019/3/6.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : NSObject

@property(nonatomic,strong)NSString *cityName;
@property(nonatomic,strong)NSDictionary *todayDic;
@property(nonatomic,strong)NSDictionary *tomorrowDic;
@property(nonatomic,strong)NSDictionary *afterTomorrowDic;

@end

NS_ASSUME_NONNULL_END
