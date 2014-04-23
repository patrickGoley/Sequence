//
//  SQNSequenceViewController.m
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNSequenceViewController.h"
#import "Sequence.h"
#import "SQNImageScrubberView.h"
#import "SQNAddEntryViewController.h"

@interface SQNSequenceViewController () <SQNImageScrubberViewDataSource, SQNAddEntryViewControllerDelegate>

@property (nonatomic, strong) Sequence *sequence;
@property (nonatomic, strong) SQNImageScrubberView *imageScrubberView;
@property (nonatomic, strong) NSMutableArray *imagesURLs;

@end

@implementation SQNSequenceViewController

- (instancetype)initWithSequence:(Sequence *)sequence {
    
    self = [super init];
    if (self) {
        
        _sequence = sequence;
        
        _imagesURLs = [[sequence sortedSequenceImageURLs] mutableCopy];
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *addEntry = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewEntry:)];
    
    self.navigationItem.rightBarButtonItem = addEntry;
    
    self.imageScrubberView = [[SQNImageScrubberView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    
    self.imageScrubberView.dataSource = self;
    
    [self.view addSubview:self.imageScrubberView];
    
    [self.imageScrubberView reloadData];
}

#pragma mark - Add Entry

- (void)addNewEntry:(id)sender {
    
    SQNAddEntryViewController *addEntryVC = [[SQNAddEntryViewController alloc] init];
    
    addEntryVC.delegate = self;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:addEntryVC];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)addEntryViewController:(SQNAddEntryViewController *)addEntryViewController didCaptureImage:(UIImage *)image {
    
    NSURL *newImageURL = [self.sequence addSequenceEntryWithImage:image];
    
    [self.imagesURLs addObject:newImageURL];
    
    [self.imageScrubberView reloadData];
}

#pragma mark - SQNImageScrubberViewDataSource

- (NSUInteger)numberOfImagesInScrubberView:(SQNImageScrubberView *)scrubberView {
    
    return self.imagesURLs.count;
}

- (UIImage *)imageAtIndex:(NSUInteger)index {
    
    if (index >= self.imagesURLs.count) return nil;
    
    NSURL *imageURL = self.imagesURLs[index];
    
    NSData *data = [NSData dataWithContentsOfFile:imageURL.path];
    
    UIImage *image = [UIImage imageWithData:data];
    
    return image;
}

@end
