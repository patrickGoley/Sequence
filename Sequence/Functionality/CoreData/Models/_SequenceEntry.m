// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SequenceEntry.m instead.

#import "_SequenceEntry.h"

const struct SequenceEntryAttributes SequenceEntryAttributes = {
	.createdDate = @"createdDate",
	.entryId = @"entryId",
	.originalImagePath = @"originalImagePath",
	.remoteImageURL = @"remoteImageURL",
	.userDescription = @"userDescription",
};

const struct SequenceEntryRelationships SequenceEntryRelationships = {
	.sequence = @"sequence",
};

const struct SequenceEntryFetchedProperties SequenceEntryFetchedProperties = {
};

@implementation SequenceEntryID
@end

@implementation _SequenceEntry

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SequenceEntry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SequenceEntry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SequenceEntry" inManagedObjectContext:moc_];
}

- (SequenceEntryID*)objectID {
	return (SequenceEntryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"entryIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"entryId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdDate;






@dynamic entryId;



- (int32_t)entryIdValue {
	NSNumber *result = [self entryId];
	return [result intValue];
}

- (void)setEntryIdValue:(int32_t)value_ {
	[self setEntryId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveEntryIdValue {
	NSNumber *result = [self primitiveEntryId];
	return [result intValue];
}

- (void)setPrimitiveEntryIdValue:(int32_t)value_ {
	[self setPrimitiveEntryId:[NSNumber numberWithInt:value_]];
}





@dynamic originalImagePath;






@dynamic remoteImageURL;






@dynamic userDescription;






@dynamic sequence;

	






@end
