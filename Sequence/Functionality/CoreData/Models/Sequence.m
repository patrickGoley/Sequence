#import "Sequence.h"
#import "SequenceEntry.h"
#import "SQNCoreDataManager.h"

@interface Sequence ()

// Private interface goes here.

@end


@implementation Sequence

@synthesize sortedImageURLs = _sortedImageURLs;

+ (NSString *)primaryKey {
    
    return @"sequenceId";
}

+ (NSArray *)allSequences {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    
    NSSortDescriptor *dateSort = [NSSortDescriptor sortDescriptorWithKey:@"createdDate" ascending:YES];
    
    request.sortDescriptors = @[dateSort];
    
    return [[SQNCoreDataManager currentContext] executeFetchRequest:request error:nil];
}

+ (instancetype)insertInCurrentContext {
    
    Sequence *sequence = [super insertInCurrentContext];
    
    sequence.createdDate = [NSDate date];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    BOOL isDirectory;
    
    NSString *directoryPath = [sequence sequenceImageDirectory];
    
    if ([fileManager fileExistsAtPath:directoryPath isDirectory:&isDirectory]) {
        
        [fileManager removeItemAtPath:directoryPath error:nil];
    }
    
    [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    return sequence;
}

- (NSArray *)sortedImageURLs {
    
    if (!_sortedImageURLs) {
        
        NSSortDescriptor *createdDateSort = [NSSortDescriptor sortDescriptorWithKey:@"createdDate" ascending:YES];
        
        NSArray *sortedEntries = [self.entries sortedArrayUsingDescriptors:@[createdDateSort]];
        
        NSMutableArray *urls = [NSMutableArray array];
        
        for (SequenceEntry *entry in sortedEntries) {
            
            NSURL *imageUrl = [NSURL fileURLWithPath:entry.originalImagePath];
            
            if (imageUrl) {
                
                [urls addObject:imageUrl];
            }
        }
        
        _sortedImageURLs = [NSArray arrayWithArray:urls];
    }
    
    return _sortedImageURLs;
}

- (NSURL *)addSequenceEntryWithImage:(UIImage *)image {
    
    SequenceEntry *newEntry = [SequenceEntry insertInCurrentContext];
    
    NSString *fullImagePath = [[self sequenceImageDirectory] stringByAppendingPathComponent:newEntry.entryId.stringValue];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0);
    
    [imageData writeToFile:fullImagePath atomically:NO];
    
    newEntry.originalImagePath = fullImagePath;
    
    [self addEntriesObject:newEntry];
    
    
    //add new image url to the sorted list
    
    NSURL *imageFileURL = [NSURL fileURLWithPath:fullImagePath];
    
    NSMutableArray *imageURLs = [self.sortedImageURLs mutableCopy];
    
    [imageURLs addObject:imageFileURL];
    
    _sortedImageURLs = [NSArray arrayWithArray:imageURLs];
    
    return imageFileURL;
}

- (UIImage *)previewOverlayImage {
    
    NSInteger previewOffset = self.overlayImageOffsetValue;
    
    NSInteger maxIndex = self.sortedImageURLs.count;
    
    NSInteger overlayImageIndex = maxIndex - previewOffset;
    
    if (overlayImageIndex >= 0 && overlayImageIndex < maxIndex) {
        
        NSURL *imageURL = self.sortedImageURLs[overlayImageIndex];
        
        return [UIImage imageWithContentsOfFile:imageURL.path];
        
    } else {
        
        return nil;
    }
}

- (NSString *)sequenceImageDirectory {
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    return [documentsDirectory stringByAppendingPathComponent:self.sequenceId.stringValue];
}

@end
