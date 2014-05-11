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
#import "SQNSequenceSettingsViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

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
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //bar buttons
    
    UIBarButtonItem *addEntry = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewEntry:)];
    
    self.navigationItem.rightBarButtonItem = addEntry;
    
    UIBarButtonItem *showSettings = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(showSettings:)];
    
    self.navigationItem.leftBarButtonItem = showSettings;
    
    //set up image scrubber
    
    self.imageScrubberView = [[SQNImageScrubberView alloc] initWithFrame:CGRectMake(0, 17.0, CGRectGetWidth(self.view.bounds), 427.0f)];
    
    self.imageScrubberView.dataSource = self;
    
    [self.view addSubview:self.imageScrubberView];
    
    
    //set up reactions
    
    [self setupReactions];
}

- (void)setupReactions {
    
    RAC(self, title) = RACObserve(self, sequence.displayName);
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self reloadData];
}

- (void)reloadData {
    
    self.imagesURLs = [self.sequence sortedSequenceImageURLs];
    
    [self.imageScrubberView reloadData];
}

#pragma mark - Bar Button Actions

- (void)addNewEntry:(id)sender {
    
    SQNAddEntryViewController *addEntryVC = [[SQNAddEntryViewController alloc] initWithSequence:self.sequence];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:addEntryVC];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)showSettings:(id)sender {
    
    SQNSequenceSettingsViewController *settingsVC = [[SQNSequenceSettingsViewController alloc] initWithSequence:self.sequence];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:settingsVC];
    
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
