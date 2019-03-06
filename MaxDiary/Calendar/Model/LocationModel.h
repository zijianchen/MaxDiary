//
//  LocationModel.h
//  MaxDiary
//
//  Created by max on 2019/3/6.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import <Foundation/Foundation.h>

 #import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

// block 回调
typedef void(^saveLocationBlock)(double lat,double lon ,NSString *cityName);

@interface LocationModel : NSObject

+ (void)getUserLocation:(saveLocationBlock)locationBlock;

@end

NS_ASSUME_NONNULL_END
