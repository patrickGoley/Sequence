// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SequenceEntry.h instead.

#import <CoreData/CoreData.h>


extern const struct SequenceEntryAttributes {
	__unsafe_unretained NSString *createdDate;
	__unsafe_unretained NSString *entryId;
	__unsafe_unretained NSString *originalImagePath;
	__unsafe_unretained NSString *remoteImageURL;
	__unsafe_unretained NSString *userDescription;
} SequenceEntryAttributes;

extern const struct SequenceEntryRelationships {
	__unsafe_unretained NSString *sequence;
} SequenceEntryRelationships;

extern const struct SequenceEntryFetchedProperties {
} SequenceEntryFetchedProperties;

@class Sequence;







@interface SequenceEntryID : NSManagedObjectID {}
@end

@interface _SequenceEntry : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SequenceEntryID*)objectID;





@property (nonatomic, strong) NSDate* createdDate;



//- (BOOL)validateCreatedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* entryId;



@property int32_t entryIdValue;
- (int32_t)entryIdValue;
- (void)setEntryIdValue:(int32_t)value_;

//- (BOOL)validateEntryId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* originalImagePath;



//- (BOOL)validateOriginalImagePath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteImageURL;



//- (BOOL)validateRemoteImageURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userDescription;



//- (BOOL)validateUserDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Sequence *sequence;

//- (BOOL)validateSequence:(id*)value_ error:(NSError**)error_;





@end

@interface _SequenceEntry (CoreDataGeneratedAccessors)

@end

@interface _SequenceEntry (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedDate;
- (void)setPrimitiveCreatedDate:(NSDate*)value;




- (NSNumber*)primitiveEntryId;
- (void)setPrimitiveEntryId:(NSNumber*)value;

- (int32_t)primitiveEntryIdValue;
- (void)setPrimitiveEntryIdValue:(int32_t)value_;




- (NSString*)primitiveOriginalImagePath;
- (void)setPrimitiveOriginalImagePath:(NSString*)value;




- (NSString*)primitiveRemoteImageURL;
- (void)setPrimitiveRemoteImageURL:(NSString*)value;




- (NSString*)primitiveUserDescription;
- (void)setPrimitiveUserDescription:(NSString*)value;





- (Sequence*)primitiveSequence;
- (void)setPrimitiveSequence:(Sequence*)value;


@end
