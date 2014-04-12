//
//  SQNImageScrubberView.m
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNImageScrubberView.h"

@interface SQNImageScrubberView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSUInteger numberOfImages;
@property (nonatomic, assign) NSUInteger currentIndex;

@end

@implementation SQNImageScrubberView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self addSubview:_imageView];
        
        [self setupGestures];
    }
    return self;
}


- (void)reloadData {
    
    if (!self.dataSource) return;
    
    self.numberOfImages = [self.dataSource numberOfImagesInScrubberView:self];
    
    if (self.currentIndex > self.numberOfImages) {
        
        self.currentIndex = MAX(0, self.numberOfImages - 1);
    }
    
    self.imageView.image = [self.dataSource imageAtIndex:self.currentIndex];
}

- (void)setCurrentIndex:(NSUInteger)currentIndex {
    
    if (_currentIndex != currentIndex) {
        
        self.imageView.image = [self.dataSource imageAtIndex:currentIndex];
    }
    
    _currentIndex = currentIndex;
}

#pragma mark - Gestures

- (void)setupGestures {
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureCallback:)];
    [self addGestureRecognizer:panGesture];
}

- (void)panGestureCallback:(UIPanGestureRecognizer *)panGesture {
    
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        
        CGPoint gesturePoint = [panGesture translationInView:panGesture.view];
        
        self.currentIndex = [self scrubbingIndexForPoint:gesturePoint];
    }
}

- (NSUInteger)scrubbingIndexForPoint:(CGPoint)point {
    
    CGFloat scrubbingIndexWidth = CGRectGetWidth(self.bounds) / self.numberOfImages;
    
    NSUInteger scrubbingIndex = point.x / scrubbingIndexWidth;
    
    return scrubbingIndex;
}

@end
