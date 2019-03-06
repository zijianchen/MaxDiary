//
//  CityGroupTableViewController.h
//  MaxDiary
//
//  Created by max on 2019/3/4.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CityBlock)(NSString *cityName);

@interface CityGroupTableViewController : UITableViewController

// block传值
@property(nonatomic,copy)CityBlock block;

@end

NS_ASSUME_NONNULL_END
