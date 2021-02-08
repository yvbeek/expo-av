#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EXAVInterstitial : NSObject

@property (nonatomic, strong, readonly) NSString *identifier;
@property (nonatomic, assign, readonly) double startTime;
@property (nonatomic, assign, readonly) double endTime;
@property (nonatomic, assign, readonly) double duration;
@property (nonatomic, assign, readonly) bool skippable;

+ (instancetype)interstitialWithId:(NSString *)identifier
                         startTime:(double)startTime
                          duration:(double)duration
                         skippable:(bool)skippable;

- (instancetype)initWithId:(NSString*)identifier
                 startTime:(double)startTime
                  duration:(double)duration
                 skippable:(bool)skippable;

- (bool)containsPosition:(double)position;

@end

NS_ASSUME_NONNULL_END
