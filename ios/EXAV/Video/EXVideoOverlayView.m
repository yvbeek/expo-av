#import "EXVideoOverlayView.h"

@interface EXVideoOverlayView()
@property (nonatomic, weak) IBOutlet UILabel *interstitialLabel;
@end

@implementation EXVideoOverlayView

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    // Configure the view
    self.translatesAutoresizingMaskIntoConstraints = false;

    // Create a label for interstitials
    UILabel *interstitialLabel = [[UILabel alloc] init];
    self.interstitialLabel = interstitialLabel;

    interstitialLabel.translatesAutoresizingMaskIntoConstraints = false;
    interstitialLabel.font = [UIFont boldSystemFontOfSize:14];
    interstitialLabel.text = @"Sponsored Content";
    interstitialLabel.textAlignment = NSTextAlignmentCenter;
    interstitialLabel.textColor = [UIColor whiteColor];
    interstitialLabel.layer.masksToBounds = false;
    interstitialLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    interstitialLabel.layer.shadowOffset = CGSizeMake(1, 1);
    interstitialLabel.layer.shadowOpacity = 0.6;
    interstitialLabel.layer.shadowRadius = 2.0;
    [self addSubview:interstitialLabel];

    [interstitialLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:14].active = true;
    [interstitialLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = true;
    [interstitialLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = true;

    // Disable interstitials by default
    [self setInterstitialsEnabled:false];
  }

  return self;
}

- (void)setInterstitialsEnabled:(BOOL)enabled {
  self.interstitialLabel.hidden = !enabled;
}

@end
