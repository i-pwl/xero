#line 1 "xero.x"
#import "xero.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBHomeScreenView; @class SBIconContentView; @class SBFloatingDockView; 
static void (*_logos_orig$_ungrouped$SBIconContentView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL SBIconContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBIconContentView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBIconContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFloatingDockView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL SBFloatingDockView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBFloatingDockView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBFloatingDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBHomeScreenView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL SBHomeScreenView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBHomeScreenView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBHomeScreenView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBHomeScreenView$parseJSON$optDict$(_LOGOS_SELF_TYPE_NORMAL SBHomeScreenView* _LOGOS_SELF_CONST, SEL, UIView *, NSDictionary *); 

#line 3 "xero.x"


    static void _logos_method$_ungrouped$SBIconContentView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBIconContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        [self removeFromSuperview];
    }




    static void _logos_method$_ungrouped$SBFloatingDockView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBFloatingDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        [self removeFromSuperview];
    }




    static void _logos_method$_ungrouped$SBHomeScreenView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBHomeScreenView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        _logos_orig$_ungrouped$SBHomeScreenView$didMoveToWindow(self, _cmd);
        NSData *JSONData = [NSData dataWithContentsOfFile:@"/var/mobile/Library/xero/test.json"];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:NULL];


        for (NSString *key in json)
        {
            NSDictionary *view = json[key];
            [self parseJSON: self optDict: view];
        }
    }

    

    static void _logos_method$_ungrouped$SBHomeScreenView$parseJSON$optDict$(_LOGOS_SELF_TYPE_NORMAL SBHomeScreenView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * arg1, NSDictionary * arg2) {
        if (arg2)
        {
            UIView *object = [UIView new];
            [arg1 addSubview: object];

            
            NSArray *insets = [arg2 valueForKey: @"insets"];
            NSNumber *radius = [arg2 valueForKey: @"radius"];
            if (insets[0] && insets[1] && insets[2] && insets[3])
            {
                NSString *t = insets[0];
                NSString *l = insets[1];
                NSString *b = insets[2];
                NSString *r = insets[3];

                object.translatesAutoresizingMaskIntoConstraints = NO;
                [object.topAnchor constraintEqualToAnchor:arg1.topAnchor constant:[t floatValue]].active = YES;
                [object.leftAnchor constraintEqualToAnchor:arg1.leftAnchor constant:[l floatValue]].active = YES;
                [object.bottomAnchor constraintEqualToAnchor:arg1.bottomAnchor constant:-[b floatValue]].active = YES;
                [object.rightAnchor constraintEqualToAnchor:arg1.rightAnchor constant:-[r floatValue]].active = YES;


                if (radius)
                {
                    object.layer.cornerRadius = [radius floatValue];
                    object.clipsToBounds = YES;
                }
            }

            
            NSString *backgroundColor = [arg2 valueForKey: @"backgroundColor"];
            if (backgroundColor)
            {
                unsigned rgb = 0;
                NSScanner *scanner = [NSScanner scannerWithString: backgroundColor];
                [scanner setScanLocation: 1];
                [scanner scanHexInt:&rgb];

                object.backgroundColor = [UIColor colorWithRed: ((rgb & 0xFF0000) >> 16 ) / 255.0
                    green: ((rgb & 0xFF00)   >> 8  ) / 255.0
                    blue: (rgb & 0xFF) / 255.0
                    alpha: 1
                ];
            }

            
            NSString *image = [arg2 valueForKey: @"image"];
            NSString *imagemode = [arg2 valueForKey: @"imagemode"];
            if (image)
            {
                UIImageView *newImg = [UIImageView new];
                newImg.image = [UIImage imageWithContentsOfFile: image];
                [object addSubview: newImg];

                newImg.translatesAutoresizingMaskIntoConstraints = NO;
                
                [newImg.leftAnchor constraintEqualToAnchor: object.leftAnchor].active = YES;
                [newImg.topAnchor constraintEqualToAnchor: object.topAnchor].active = YES;
                [newImg.bottomAnchor constraintEqualToAnchor: object.bottomAnchor].active = YES;
                [newImg.rightAnchor constraintEqualToAnchor: object.rightAnchor].active = YES;
            }

            
            NSString *text = [arg2 valueForKey: @"text"];
            NSString *textColor = [arg2 valueForKey: @"textColor"];
            if (text)
            {
                UILabel *label = [UILabel new];
                label.translatesAutoresizingMaskIntoConstraints = NO;
                [object addSubview: label];

                [label.leftAnchor constraintEqualToAnchor: object.leftAnchor].active = YES;
                [label.rightAnchor constraintEqualToAnchor: object.rightAnchor].active = YES;
                [label.topAnchor constraintEqualToAnchor: object.topAnchor].active = YES;
                [label.bottomAnchor constraintEqualToAnchor: object.bottomAnchor].active = YES;

                label.text = text;
                label.userInteractionEnabled = NO;

                if (textColor)
                {
                    unsigned rgb = 0;
                    NSScanner *scanner = [NSScanner scannerWithString: textColor];
                    [scanner setScanLocation: 1];
                    [scanner scanHexInt:&rgb];
                    label.textColor = [UIColor colorWithRed: ((rgb & 0xFF0000) >> 16 ) / 255.0
                        green: ((rgb & 0xFF00)   >> 8  ) / 255.0
                        blue: (rgb & 0xFF) / 255
                        alpha: 1
                    ];
                }
            }

            
            NSMutableDictionary *subview_dict = [arg2 valueForKey: @"subview"];
            if (subview_dict)
            {
                [self parseJSON:object optDict: subview_dict];
            }
        }
    }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBIconContentView = objc_getClass("SBIconContentView"); { MSHookMessageEx(_logos_class$_ungrouped$SBIconContentView, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$SBIconContentView$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$SBIconContentView$didMoveToWindow);}Class _logos_class$_ungrouped$SBFloatingDockView = objc_getClass("SBFloatingDockView"); { MSHookMessageEx(_logos_class$_ungrouped$SBFloatingDockView, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$SBFloatingDockView$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$SBFloatingDockView$didMoveToWindow);}Class _logos_class$_ungrouped$SBHomeScreenView = objc_getClass("SBHomeScreenView"); { MSHookMessageEx(_logos_class$_ungrouped$SBHomeScreenView, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$SBHomeScreenView$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$SBHomeScreenView$didMoveToWindow);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIView *), strlen(@encode(UIView *))); i += strlen(@encode(UIView *)); memcpy(_typeEncoding + i, @encode(NSDictionary *), strlen(@encode(NSDictionary *))); i += strlen(@encode(NSDictionary *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBHomeScreenView, @selector(parseJSON:optDict:), (IMP)&_logos_method$_ungrouped$SBHomeScreenView$parseJSON$optDict$, _typeEncoding); }} }
#line 137 "xero.x"
