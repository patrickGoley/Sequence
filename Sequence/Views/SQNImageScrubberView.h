//
//  SQNImageScrubberView.h
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQNImageScrubberView;

@protocol SQNImageScrubberViewDataSource <NSObject>

- (NSUInteger)numberOfImagesInScrubberView:(SQNImageScrubberView *)scrubberView;

- (UIImage *)imageAtIndex:(NSUInteger)index;

@end

@interface SQNImageScrubberView : UIView

@property (nonatomic, weak) id<SQNImageScrubberViewDataSource> dataSource;

- (void)reloadData;

@end
