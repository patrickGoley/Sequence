// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PhaseEntry.h instead.

#import <CoreData/CoreData.h>


extern const struct PhaseEntryAttributes {
	__unsafe_unretained NSString *createdDate;
	__unsafe_unretained NSString *entryId;
	__unsafe_unretained NSString *originalImagePath;
	__unsafe_unretained NSString *remoteImageURL;
	__unsafe_unretained NSString *userDescription;
} PhaseEntryAttributes;

extern const struct PhaseEntryRelationships {
	__unsafe_unretained NSString *phase;
} PhaseEntryRelationships;

extern const struct PhaseEntryFetchedProperties {
} PhaseEntryFetchedProperties;

@class Phase;







@interface PhaseEntryID : NSManagedObjectID {}
@end

@interface _PhaseEntry : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PhaseEntryID*)objectID;





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





@property (nonatomic, strong) Phase *phase;

//- (BOOL)validatePhase:(id*)value_ error:(NSError**)error_;





@end

@interface _PhaseEntry (CoreDataGeneratedAccessors)

@end

@interface _PhaseEntry (CoreDataGeneratedPrimitiveAccessors)


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





- (Phase*)primitivePhase;
- (void)setPrimitivePhase:(Phase*)value;


@end
