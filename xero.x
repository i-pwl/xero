#import "xero.h"

%hook SBIconContentView
    -(void)didMoveToWindow
    {
        [self removeFromSuperview];
    }
%end

%hook SBFloatingDockView
    -(void)didMoveToWindow
    {
        [self removeFromSuperview];
    }
%end

%hook SBHomeScreenView
    -(void)didMoveToWindow
    {
        %orig;
        NSData *JSONData = [NSData dataWithContentsOfFile:@"/var/mobile/Library/xero/test.json"];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:NULL];


        for (NSString *key in json)
        {
            NSDictionary *view = json[key];
            [self parseJSON: self optDict: view];
        }
    }

    %new
    -(void)parseJSON:(UIView *)arg1 optDict:(NSDictionary *)arg2
    {
        if (arg2)
        {
            UIView *object = [UIView new];
            [arg1 addSubview: object];

            // Frame stuff
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

            // Setting color
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

            // Images
            NSString *image = [arg2 valueForKey: @"image"];
            NSString *imagemode = [arg2 valueForKey: @"imagemode"];
            if (image)
            {
                UIImageView *newImg = [UIImageView new];
                newImg.image = [UIImage imageWithContentsOfFile: image];
                [object addSubview: newImg];

                newImg.translatesAutoresizingMaskIntoConstraints = NO;
                newImg.userInteractionEnabled = NO;
                
                [newImg.leftAnchor constraintEqualToAnchor: object.leftAnchor].active = YES;
                [newImg.topAnchor constraintEqualToAnchor: object.topAnchor].active = YES;
                [newImg.bottomAnchor constraintEqualToAnchor: object.bottomAnchor].active = YES;
                [newImg.rightAnchor constraintEqualToAnchor: object.rightAnchor].active = YES;
            }

            // Adding Text
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

            // Recursion
            NSMutableDictionary *subview_dict = [arg2 valueForKey: @"subview"];
            if (subview_dict)
            {
                [self parseJSON:object optDict: subview_dict];
            }
        }
    }
%end
