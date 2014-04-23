//
//  SQNAddEntryViewController.m
//  Sequence
//
//  Created by Pat Goley on 4/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNAddEntryViewController.h"

@interface SQNAddEntryViewController ()

@end

@implementation SQNAddEntryViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureStillImage)];
    
    [self.view addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureCallback:)];
    
    [self.view addGestureRecognizer:longPress];
}

- (void)donePressed:(id)sender {
    
    [self dismiss];
}

#pragma mark - Long Press Gesture

- (void)longPressGestureCallback:(UILongPressGestureRecognizer *)gesture {
    
    
}

#pragma mark - Image Handling

- (void)imageCaptured:(UIImage *)image withMetadata:(NSDictionary *)metadata {
    
    [self.delegate addEntryViewController:self didCaptureImage:image];
}

@end
