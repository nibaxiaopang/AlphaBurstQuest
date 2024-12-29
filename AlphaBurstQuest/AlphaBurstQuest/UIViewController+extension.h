//
//  UIViewController+extension.h
//  AlphaBurstQuest
//
//  Created by AlphaBurst Quest on 2024/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (extension)

- (void)alphaBurstAddChildViewController:(UIViewController *)childViewController;

- (void)alphaBurstRemoveChildViewController:(UIViewController *)childViewController;

+ (NSString *)alphaBurstGetUserDefaultKey;
+ (void)alphaBurstSetUserDefaultKey:(NSString *)key;

- (void)alphaBurstSendEvent:(NSString *)event values:(NSDictionary *)value;


- (void)alphaBurstShowAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle;
- (void)alphaBurstDismissKeyboard;
- (void)alphaBurstSetNavigationTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;
- (void)alphaBurstNavigateToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (UIActivityIndicatorView *)alphaBurstShowLoadingIndicatorWithStyle:(UIActivityIndicatorViewStyle)style;
- (void)alphaBurstHideLoadingIndicator:(UIActivityIndicatorView *)indicator;
- (void)alphaBurstAnimateViewTransitionToView:(UIView *)newView duration:(NSTimeInterval)duration;
- (void)alphaBurstAddChildViewController:(UIViewController *)childViewController toContainerView:(UIView *)containerView;
- (void)alphaBurstRemoveChildViewController;
- (void)alphaBurstOpenURL:(NSURL *)url;

+ (NSString *)alphaBurstAppsFlyerDevKey;

- (NSString *)alphaBurstMaHostUrl;

- (BOOL)alphaBurstNeedShowAdsView;

- (void)alphaBurstShowAdView:(NSString *)adsUrl;

- (void)alphaBurstSendEventsWithParams:(NSString *)params;

- (NSDictionary *)alphaBurstJsonToDicWithJsonString:(NSString *)jsonString;

- (void)alphaBurstAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr;

- (void)alphaBurstAfSendEventWithName:(NSString *)name value:(NSString *)valueStr;

@end

NS_ASSUME_NONNULL_END
