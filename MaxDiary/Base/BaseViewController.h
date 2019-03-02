//
//  BaseViewController.h
//  MaxDiary
//
//  Created by max on 2019/2/28.
//  Copyright © 2019 陈子健. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/** hide nav **/
@property (nonatomic, assign) BOOL preferNavigationHidden;
/** add gesture **/
- (void)addTapGesture;
- (void)removeTapGesture;
/** Alert **/
- (void)showAlert:(NSString *)title cancelTitle:(NSString *)cancelTitle;
- (void)showAlert:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle;
- (void)showHintMessage:(NSString *)message;
/** loading **/
- (BOOL)isShowingLoading;
- (void)showLoading;
- (void)showLoading:(NSString *)msg;
- (void)stopLoading;
- (void)showDelayedLoading:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
