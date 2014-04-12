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
    
    newEntry.createdDate = [NSDate date];
    
    NSString *fullImagePath = [[self sequenceImageDirectory] stringByAppendingPathComponent:newEntry.entryId.stringValue];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0);
    
    [imageData writeToFile:fullImagePath atomically:YES];
    
    newEntry.originalImagePath = fullImagePath;
    
    [self addEntriesObject:newEntry];
    
    return [NSURL fileURLWithPath:fullImagePath];
}

- (NSString *)sequenceImageDirectory {
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    return [documentsDirectory stringByAppendingPathComponent:self.sequenceId.stringValue];
}

@end
