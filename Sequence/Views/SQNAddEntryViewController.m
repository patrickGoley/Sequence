//
//  SQNAddEntryViewController.m
//  Sequence
//
//  Created by Pat Goley on 4/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNAddEntryViewController.h"
#import "Sequence.h"

@interface SQNAddEntryViewController ()

@property (nonatomic, strong) Sequence *sequence;
@property (nonatomic, strong) NSTimer *captureTimer;
@property (nonatomic, strong) UIImageView *previousImageView;

@end

@implementation SQNAddEntryViewController

- (instancetype)initWithSequence:(Sequence *)sequence {
    
    self = [super init];
    if (self) {
        
        _sequence = sequence;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    //preview image
    
    self.previousImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 34.0f, CGRectGetWidth(self.view.bounds), 427.0f)];
    self.previousImageView.userInteractionEnabled = NO;
    [self.view addSubview:self.previousImageView];
    
    self.previousImageView.alpha = self.sequence.overlayOpacityValue;
    
    
    //bar buttons
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    
    //gestures
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureStillImage)];
    
    [self.view addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureCallback:)];
    
    longPress.minimumPressDuration = 0.2f;
    
    longPress.allowableMovement = CGFLOAT_MAX;
    longPress.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:longPress];
}

- (void)donePressed:(id)sender {
    
    [self dismiss];
}

- (void)loadPreviousImageOverlay {
    
    UIImage *previewImage = [self.sequence previewOverlayImage];
    
    NSLog(@"image: %@", previewImage);
    
    self.previousImageView.image = previewImage;
}

#pragma mark - Long Press Gesture

- (void)longPressGestureCallback:(UILongPressGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"long press began");
        
        [self.captureTimer fire];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"long press ended");
        
        [self.captureTimer invalidate];
        self.captureTimer = nil;
    }
}

- (NSTimer *)captureTimer {
    
    if (!_captureTimer) {
        
        _captureTimer = [NSTimer scheduledTimerWithTimeInterval:self.sequence.holdCaptureIntervalValue target:self selector:@selector(captureStillImage) userInfo:nil repeats:YES];
    }
    
    return _captureTimer;
}

#pragma mark - Image Handling

- (void)imageCaptured:(UIImage *)image withMetadata:(NSDictionary *)metadata {
    
    NSLog(@"image captured");
    
    [self.sequence addSequenceEntryWithImage:image];
    
    [self loadPreviousImageOverlay];
}

@end
