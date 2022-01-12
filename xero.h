#import <UIKit/UIKit.h>

@interface UIView (xero)
@property (nonatomic, assign, readwrite) NSDirectionalEdgeInsets contentEdgeInsets;
@end

@interface UIImage (xero)
+(id)_applicationIconImageForBundleIdentifier:(id)arg0 format:(int)arg1;
@end

@interface xercon : UIImageView
-(void)initWithAppBundleID:(NSString *)arg1;
@end

@interface SBIconContentView : UIView
@end

@interface SBHomeScreenView : UIView
-(void)parseJSON:(UIView *)arg1 optDict:(NSDictionary *)arg2;
@end

@interface SBFloatingDockView : UIView
@end
