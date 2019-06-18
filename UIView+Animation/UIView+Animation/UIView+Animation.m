//
//  UIView+Animation.m
//  UIView+Animation
//
//  Created by benzhang on 2019/6/18.
//  Copyright © 2019 QingDong. All rights reserved.
//

#import "UIView+Animation.h"
#import "objc/runtime.h"

#define kAnimationDuration 0.25

@implementation UIView (Animation)

- (void)pullShowAnimation {
    [self.layer pullShowAnimationWithDuration:kAnimationDuration];
}

- (void)pushHideAnimationWithFinishBlk:(void (^)(UIView * _Nonnull))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pushHideAnimationWithDuration:kAnimationDuration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

- (void)pullShowAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer pullShowAnimationWithDuration:duration];
}

- (void)pushHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pushHideAnimationWithDuration:duration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

- (void)pushShowAnimation {
    [self.layer pushShowAnimationWithDuration:kAnimationDuration];
}

- (void)pushShowAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer pushShowAnimationWithDuration:duration];
}

- (void)pullHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pullHideAnimationWithDuration:kAnimationDuration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

- (void)pullHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pullHideAnimationWithDuration:duration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

- (void)systemAlertShowAnimation {
    [self.layer systemAlertShowAnimationWithDuration:kAnimationDuration];
}

- (void)systemAlertShowAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer systemAlertShowAnimationWithDuration:duration];
}

- (void)systemAlertHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer systemAlertHideAnimationWithDuration:kAnimationDuration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

- (void)systemAlertHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer systemAlertHideAnimationWithDuration:duration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

@end




@implementation CALayer (Animation)

- (void)pullShowAnimation {
    [self pullShowAnimationWithDuration:kAnimationDuration];
}

- (void)pullShowAnimationWithDuration:(CFTimeInterval)duration {
    CGFloat y = self.frame.origin.y;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 0);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @0;
    animation.toValue = @1;
    [self addAnimation:animation forKey:@"pullShowAnimation"];
}

- (void)pushHideAnimationWithFinishBlk:(void(^)(CALayer * layer))finishBlk {
    [self pushHideAnimationWithDuration:kAnimationDuration finishBlk:finishBlk];
}

- (void)pushHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(CALayer * layer))finishBlk {
    self.finishBlk = finishBlk;
    CGFloat y = self.frame.origin.y;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 0);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @1;
    animation.toValue = @0;
    [self addAnimation:animation forKey:@"pushHideAnimation"];
}

- (void)pushShowAnimation {
    [self pushShowAnimationWithDuration:kAnimationDuration];
}

- (void)pushShowAnimationWithDuration:(CFTimeInterval)duration {
    CGFloat y = self.frame.origin.y + self.bounds.size.height;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 1);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @0;
    animation.toValue = @1;
    [self addAnimation:animation forKey:@"pushShowAnimation"];
}

- (void)pullHideAnimationWithFinishBlk:(void(^)(CALayer * layer))finishBlk {
    [self pullHideAnimationWithDuration:kAnimationDuration finishBlk:finishBlk];
}

- (void)pullHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(CALayer * layer))finishBlk {
    self.finishBlk = finishBlk;
    CGFloat y = self.frame.origin.y + self.bounds.size.height;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 1);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @1;
    animation.toValue = @0;
    [self addAnimation:animation forKey:@"pullHideAnimation"];
}

- (void)systemAlertShowAnimation {
    [self systemAlertShowAnimationWithDuration:kAnimationDuration];
}

- (void)systemAlertShowAnimationWithDuration:(CFTimeInterval)duration {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    animation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self addAnimation:animation forKey:@"ystemAlertShowAnimation"];
}

- (void)systemAlertHideAnimationWithFinishBlk:(void(^)(CALayer * layer))finishBlk {
    [self systemAlertHideAnimationWithDuration:kAnimationDuration finishBlk:finishBlk];
}

- (void)systemAlertHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(CALayer * layer))finishBlk {
    self.finishBlk = finishBlk;
    self.anchorPoint = self.anchorPoint;
    self.position = self.position;
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.values = @[
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)]
                         ];
    animation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    animation.delegate = self;
    [self addAnimation:animation forKey:@"systemAlertHideAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.anchorPoint = self.originalAnchorPoint;
    self.position = self.originalPosition;
    !self.finishBlk?:self.finishBlk(self);
}


//////////////////////////内部使用/////////////////////////////
- (void)setOriginalAnchorPoint:(CGPoint)originalAnchorPoint {
    objc_setAssociatedObject(self, @selector(originalAnchorPoint), [NSValue valueWithCGPoint:originalAnchorPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)originalAnchorPoint {
    return [objc_getAssociatedObject(self,@selector(originalAnchorPoint)) CGPointValue];
}

- (void)setOriginalPosition:(CGPoint)originalPosition {
    objc_setAssociatedObject(self, @selector(originalPosition), [NSValue valueWithCGPoint:originalPosition], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (CGPoint)originalPosition {
    return [objc_getAssociatedObject(self,@selector(originalPosition)) CGPointValue];
}

- (void)setFinishBlk:(void (^)(CALayer *))finishBlk {
    objc_setAssociatedObject(self, @selector(finishBlk), finishBlk, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(CALayer *))finishBlk {
    return objc_getAssociatedObject(self, @selector(finishBlk));
}

@end
