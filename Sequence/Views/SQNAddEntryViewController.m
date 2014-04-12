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
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureStillImage)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)donePressed:(id)sender {
    
    [self dismiss];
}

#pragma mark - Image Handling

- (void)imageCaptured:(UIImage *)image withMetadata:(NSDictionary *)metadata {
    
    [self.delegate addEntryViewController:self didCaptureImage:image];
}

@end
