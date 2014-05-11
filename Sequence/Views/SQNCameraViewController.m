//
//  SQNCameraViewController.m
//  Sequence
//
//  Created by Pat Goley on 4/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNCameraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIImage+Resize.h"

@interface SQNCameraViewController ()

@property (nonatomic, strong) AVCaptureDevice *captureDevice;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, strong) AVCaptureStillImageOutput *imageOutput;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation SQNCameraViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
        
        for (AVCaptureDevice *device in devices) {
            
            if (device.position == AVCaptureDevicePositionFront) {
                
                self.captureDevice = device;
                break;
            }
        }
    }
    
    return self;
}

- (AVCaptureSession *)captureSession {
    
    if (!_captureSession) {
        
        _captureSession = [[AVCaptureSession alloc] init];
        _captureSession.sessionPreset = AVCaptureSessionPresetPhoto;
    }
    
    return _captureSession;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self setupCaptureSession];
    [self startCameraCapture];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self tearDownCaptureSession];
}

#pragma mark AVCaptureSession

- (void)startCameraCapture {
    
    if (!self.captureSession.isRunning) {
        
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
			[self.captureSession startRunning];
            
		});
		
	};
    
}

- (void)setupCaptureSession {
    
	NSError *error;
    
	self.deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.captureDevice error:&error];
    
	if ([self.captureSession canAddInput:self.deviceInput]) {
        
		[self.captureSession addInput:self.deviceInput];
	}
    
    
    self.imageOutput = [[AVCaptureStillImageOutput alloc] init];
    
    self.imageOutput.outputSettings = @{ AVVideoCodecKey: AVVideoCodecJPEG };
    
    if ([self.captureSession canAddOutput:self.imageOutput]) {
        
        [self.captureSession addOutput:self.imageOutput];
    }
	
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
	self.previewLayer.frame = self.view.bounds;
	[self.view.layer insertSublayer:self.previewLayer atIndex:0];
    
    [self.captureSession commitConfiguration];
}

- (void)tearDownCaptureSession {
    
    [self.captureSession stopRunning];
	self.captureSession = nil;
	
	[self.previewLayer removeFromSuperlayer];
	self.previewLayer = nil;
}

#pragma Capture

- (void)captureStillImage {
    
    if(self.imageOutput.isCapturingStillImage || !self.captureSession.isRunning || !self.imageOutput.connections.firstObject) {
        return;
    }
    
    __weak typeof(self)weakSelf = self;
    
    [self.imageOutput captureStillImageAsynchronouslyFromConnection:self.imageOutput.connections.firstObject completionHandler:^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
        
        if(imageSampleBuffer != NULL){
            
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
            
            CFDictionaryRef metadata = CMCopyDictionaryOfAttachments(NULL, imageSampleBuffer, kCMAttachmentMode_ShouldPropagate);
            NSDictionary *metadataDictionary = (__bridge_transfer NSDictionary *)metadata;
            
            UIImage *image = [UIImage imageWithData:imageData];
            
            image = [UIImage rotate:image andOrientation:UIImageOrientationRight];
            
            image = [UIImage imageWithCGImage:image.CGImage
                                scale:image.scale orientation:UIImageOrientationUpMirrored];
            
            [weakSelf imageCaptured:image withMetadata:metadataDictionary];
        }
        
    }];
    
}

- (void)imageCaptured:(UIImage *)image withMetadata:(NSDictionary *)metadata {
    
    
}

@end
