//
//  TMAppDelegate.h
//  Tough Mudder
//
//  Created by Justin Cohen on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate> {
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectContext *managedObjectContext;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;

@end
