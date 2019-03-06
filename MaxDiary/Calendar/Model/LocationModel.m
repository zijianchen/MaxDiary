//
//  LocationModel.m
//  MaxDiary
//
//  Created by max on 2019/3/6.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import "LocationModel.h"

#import <UIKit/UIKit.h>

@interface LocationModel ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) saveLocationBlock savelocationBlock;
@property (nonatomic, strong) NSString *cityName;
@end

@implementation LocationModel

// 单例模式
+ (id)sharedLoactionManager {
    static LocationModel *locationManager = nil;
    if (!locationManager) {
        locationManager = [[LocationModel alloc]init];
    }
    return locationManager;
}

// 重写init方法初始化manager对象来征求用户同意
- (instancetype)init {
    if (self = [super init]) {
        self.manager = [[CLLocationManager alloc]init];
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            [self.manager requestWhenInUseAuthorization];
        }
        self.manager.delegate = self;
    }
    return self;
}

+ (void)getUserLocation:(saveLocationBlock)locationBlock {
    
    LocationModel *locationMangaer = [LocationModel sharedLoactionManager];
    return[locationMangaer getUserLoaction:locationBlock];
}

- (void)getUserLoaction:(saveLocationBlock)locationBlock
{
    if (![CLLocationManager locationServicesEnabled]) {
        return;
    }
    if ([CLLocationManager locationServicesEnabled]  // 确定用户的位置服务启用
        &&[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
        // 若位置服务是在设置中禁用，则默认定位在北京
        _savelocationBlock = [locationBlock copy];
        _savelocationBlock(39.9110130000,116.4135540000,@"北京");
        
        return;
    }
    
    _savelocationBlock = [locationBlock copy];
    self.manager.distanceFilter = 100;
    [self.manager startUpdatingLocation];
}

#pragma mark - CLLocatoinManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error) {
            NSString *cityName = placemarks.lastObject.addressDictionary[@"City"];
            NSString *str = [cityName substringToIndex:cityName.length -1];
            _savelocationBlock(location.coordinate.latitude,location.coordinate.longitude,str);
            
        }
        
    }];
    
}

@end
