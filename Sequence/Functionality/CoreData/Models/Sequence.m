#import "Sequence.h"
#import "SequenceEntry.h"
#import "SQNCoreDataManager.h"

@interface Sequence ()

// Private interface goes here.

@end


@implementation Sequence

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

- (NSArray *)sortedSequenceImageURLs {
    
    NSSortDescriptor *createdDateSort = [NSSortDescriptor sortDescriptorWithKey:@"createdDate" ascending:YES];
    
    NSArray *sortedEntries = [self.entries sortedArrayUsingDescriptors:@[createdDateSort]];
    
    NSMutableArray *urls = [NSMutableArray array];
    
    for (SequenceEntry *entry in sortedEntries) {
        
        NSURL *imageUrl = [NSURL fileURLWithPath:entry.originalImagePath];
        
        if (imageUrl) {
            
            [urls addObject:imageUrl];
        }
    }
    
    return [NSArray arrayWithArray:urls];
}

- (NSURL *)addSequenceEntryWithImage:(UIImage *)image {
    
    SequenceEntry *newEntry = [SequenceEntry insertInCurrentContext];
    
    NSString *fullImagePath = [[self sequenceImageDirectory] stringByAppendingPathComponent:newEntry.entryId.stringValue];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0);
    
    [imageData writeToFile:fullImagePath atomically:NO];
    
    newEntry.originalImagePath = fullImagePath;
    
    [self addEntriesObject:newEntry];
    
    return [NSURL fileURLWithPath:fullImagePath];
}

- (NSString *)sequenceImageDirectory {
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    return [documentsDirectory stringByAppendingPathComponent:self.sequenceId.stringValue];
}

@end
