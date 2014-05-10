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

@interface SQNSequenceViewController () <SQNImageScrubberViewDataSource>

@property (nonatomic, strong) Sequence *sequence;
@property (nonatomic, strong) SQNImageScrubberView *imageScrubberView;
@property (nonatomic, strong) NSArray *imagesURLs;

@end

@implementation SQNSequenceViewController

- (instancetype)initWithSequence:(Sequence *)sequence {
    
    self = [super init];
    if (self) {
        
        _sequence = sequence;
        
        _imagesURLs = [sequence sortedSequenceImageURLs];
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *addEntry = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewEntry:)];
    
    self.navigationItem.rightBarButtonItem = addEntry;
    
    self.imageScrubberView = [[SQNImageScrubberView alloc] initWithFrame:CGRectMake(0, 17.0, CGRectGetWidth(self.view.bounds), 427.0f)];
    
    self.imageScrubberView.dataSource = self;
    
    [self.view addSubview:self.imageScrubberView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.imageScrubberView reloadData];
}

#pragma mark - Add Entry

- (void)addNewEntry:(id)sender {
    
    SQNAddEntryViewController *addEntryVC = [[SQNAddEntryViewController alloc] initWithSequence:self.sequence];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:addEntryVC];
    
    [self presentViewController:nav animated:YES completion:nil];
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
