//
//  UISlider+RACSignal.m
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "UISlider+RACSignal.h"

@implementation UISlider (RACSignal)

- (RACSignal *)rac_valueChangedSignal {
    
    return [[self rac_signalForControlEvents:UIControlEventValueChanged] map:^id(UISlider *slider) {
        
        return @(slider.value);
    }];
}

@end
