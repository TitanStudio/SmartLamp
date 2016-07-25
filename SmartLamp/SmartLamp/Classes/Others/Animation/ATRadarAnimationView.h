//
// ATRadarAnimationView.h
// Generated by Core Animator version 1.3.1 on 2016-07-13.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface ATRadarAnimationView : UIView

@property (strong, nonatomic) NSDictionary *viewsByName;

// rotation
- (void)addRotationAnimation;
- (void)addRotationAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addRotationAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)removeRotationAnimation;

- (void)removeAllAnimations;

@end