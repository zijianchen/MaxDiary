//
//  WeatherView.h
//  MaxDiary
//
//  Created by max on 2019/3/6.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WeatherModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherView : UIImageView

@property (nonatomic,strong)WeatherModel *model; // 设置视图model
@property (nonatomic,strong)UIButton *cityBtn;

@end

NS_ASSUME_NONNULL_END
