//
//  PHSCoreDataManager.m
//  Phases
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "PHSCoreDataManager.h"

@interface PHSCoreDataManager ()

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *storeCoordinator;

@end

@implementation PHSCoreDataManager

+ (instancetype)sharedManager {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self storeCoordinator];
    }
    
    return self;
}

+ (NSManagedObjectContext *)currentContext {
    
    return [[self sharedManager] contextForThread:[NSThread currentThread]];
}

- (NSManagedObjectContext *)contextForThread:(NSThread *)thread {
    
    static NSString *threadContextKey = @"com.phases.threadContext";
    
    NSManagedObjectContext *context = thread.threadDictionary[threadContextKey];
    
    if (!context) {
        
        BOOL isMainThread = thread.isMainThread;
        
        NSManagedObjectContextConcurrencyType concurrencyType = isMainThread ? NSMainQueueConcurrencyType : NSPrivateQueueConcurrencyType;
        
        context = [[NSManagedObjectContext alloc] initWithConcurrencyType:concurrencyType];
        
        context.persistentStoreCoordinator = self.storeCoordinator;
        
        if (!isMainThread) {
            
            NSManagedObjectContext *mainContext = [self contextForThread:[NSThread mainThread]];
            
            context.parentContext = mainContext;
        }
        
        thread.threadDictionary[threadContextKey] = context;
    }
    
    return context;
}

- (NSPersistentStoreCoordinator *)storeCoordinator {
    
    if (!_storeCoordinator) {
        
        NSString* fileName = [NSString stringWithFormat:@"CoreDataStore.sqlite"];
        
        NSURL *storeUrl = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:fileName]];
        
        NSDictionary *options = @{ NSMigratePersistentStoresAutomaticallyOption: @(YES), NSInferMappingModelAutomaticallyOption: @(YES) };
        
        NSError *error = nil;
        
        _storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        if (![_storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
            
            NSLog(@"migration failed");
        }
        
        if (_storeCoordinator.persistentStores.count < 1) {
            
            NSFileManager *fileManager = [[NSFileManager alloc] init];
            
            [fileManager removeItemAtURL:storeUrl error:nil];
            
            if (![_storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
                
                NSLog(@"something failed");
            }
        }
    }
    
    return _storeCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    
    if (!_managedObjectModel) {
        
        NSURL *modelFileURL = [[NSBundle mainBundle] URLForResource:@"PhasesModel" withExtension:@"momd"];
        
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelFileURL];
    }
    
    return _managedObjectModel;
}

@end
