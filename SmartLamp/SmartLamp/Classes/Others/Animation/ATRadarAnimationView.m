//
// ATRadarAnimationView.m
// Generated by Core Animator version 1.3.1 on 2016-07-13.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

#import "ATRadarAnimationView.h"

@implementation ATRadarAnimationView

#pragma mark - Life Cycle

- (instancetype)init
{
	return [self initWithFrame:CGRectMake(0,0,500,500)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

#pragma mark - Scaling

- (void)layoutSubviews
{
	[super layoutSubviews];

	UIView *scalingView = self.viewsByName[@"__scaling__"];
	float xScale = self.bounds.size.width / scalingView.bounds.size.width;
	float yScale = self.bounds.size.height / scalingView.bounds.size.height;
	switch (self.contentMode) {
		case UIViewContentModeScaleToFill:
			break;
		case UIViewContentModeScaleAspectFill:
		{
			float scale = MAX(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
		default:
		{
			float scale = MIN(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
	}
	scalingView.transform = CGAffineTransformMakeScale(xScale, yScale);
	scalingView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

#pragma mark - Setup

- (void)setupHierarchy
{
	NSMutableDictionary *viewsByName = [NSMutableDictionary dictionary];
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];

	UIView *__scaling__ = [UIView new];
	__scaling__.bounds = CGRectMake(0, 0, 500, 500);
	__scaling__.center = CGPointMake(250.0, 250.0);
	__scaling__.layer.masksToBounds = YES;
	[self addSubview:__scaling__];
	viewsByName[@"__scaling__"] = __scaling__;

	UIImageView *radarImage = [UIImageView new];
	radarImage.bounds = CGRectMake(0, 0, 483.0, 482.0);
	UIImage *imgSlice1 = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"Slice 1.png" ofType:nil]];
	if ( imgSlice1 == nil ) { NSLog(@"** Warning: Could not create image from 'Slice 1.png'. Please make sure that it is added to the project directly (not in a folder reference)."); }
	radarImage.image = imgSlice1;
	radarImage.contentMode = UIViewContentModeCenter;
	radarImage.layer.position = CGPointMake(250.000, 250.000);
	[__scaling__ addSubview:radarImage];
	viewsByName[@"radarImage"] = radarImage;

	self.viewsByName = viewsByName;
}

#pragma mark - rotation

- (void)addRotationAnimation
{
	[self addRotationAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO];
}

- (void)addRotationAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion
{
	[self addRotationAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion];
}

- (void)addRotationAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion
{
	CAMediaTimingFunction *linearTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

	CAKeyframeAnimation *radarImageRotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	radarImageRotationAnimation.duration = 1.000;
	radarImageRotationAnimation.values = @[@(0.000), @(-6.283)];
	radarImageRotationAnimation.keyTimes = @[@(0.000), @(1.000)];
	radarImageRotationAnimation.timingFunctions = @[linearTiming];
	radarImageRotationAnimation.repeatCount = HUGE_VALF;
	radarImageRotationAnimation.beginTime = beginTime;
	radarImageRotationAnimation.fillMode = fillMode;
	radarImageRotationAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[@"radarImage"] layer] addAnimation:radarImageRotationAnimation forKey:@"rotation_Rotation"];
}

- (void)removeRotationAnimation
{
	[[self.viewsByName[@"radarImage"] layer] removeAnimationForKey:@"rotation_Rotation"];
}

- (void)removeAllAnimations
{
	for (UIView *view in self.viewsByName.allValues)
	{
		[view.layer removeAllAnimations];
	}
}

@end