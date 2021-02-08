#import "EXAVInterstitial.h"

@interface EXAVInterstitial()
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) double startTime;
@property (nonatomic, assign) double endTime;
@property (nonatomic, assign) double duration;
@property (nonatomic, assign) bool skippable;
@end

@implementation EXAVInterstitial

+ (instancetype)interstitialWithId:(NSString *)identifier
                         startTime:(double)startTime
                          duration:(double)duration
                         skippable:(bool)skippable {
  return [[self alloc] initWithId:identifier startTime:startTime duration:duration skippable:skippable];
}

- (instancetype)initWithId:(NSString*)identifier
                 startTime:(double)startTime
                  duration:(double)duration
                 skippable:(bool)skippable {
  if (self = [super init]) {
    self.identifier = [identifier copy];
    self.startTime = startTime;
    self.endTime = startTime + duration;
    self.duration = duration;
    self.skippable = skippable;
  }

  return self;
}

/// Determines if the position is in the time range of the interstitial.
- (bool)containsPosition:(double)position {
  return position >= self.startTime && position < self.endTime;
}

@end
