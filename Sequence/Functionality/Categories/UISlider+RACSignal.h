//
//  UISlider+RACSignal.h
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UISlider (RACSignal)

- (RACSignal *)rac_valueChangedSignal;

@end
