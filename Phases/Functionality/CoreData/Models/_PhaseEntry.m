// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PhaseEntry.m instead.

#import "_PhaseEntry.h"

const struct PhaseEntryAttributes PhaseEntryAttributes = {
	.createdDate = @"createdDate",
	.entryId = @"entryId",
	.originalImagePath = @"originalImagePath",
	.remoteImageURL = @"remoteImageURL",
	.userDescription = @"userDescription",
};

const struct PhaseEntryRelationships PhaseEntryRelationships = {
	.phase = @"phase",
};

const struct PhaseEntryFetchedProperties PhaseEntryFetchedProperties = {
};

@implementation PhaseEntryID
@end

@implementation _PhaseEntry

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhaseEntry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhaseEntry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhaseEntry" inManagedObjectContext:moc_];
}

- (PhaseEntryID*)objectID {
	return (PhaseEntryID*)[super objectID];
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






@dynamic phase;

	






@end
