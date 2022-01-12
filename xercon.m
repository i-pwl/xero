#import "xero.h"

@implementation xercon
    -(void)initWithAppBundleID:(NSString *)arg1
    {
        self.image = [UIImage _applicationIconImageForBundleIdentifier:arg1 format:1];
    }
@end
