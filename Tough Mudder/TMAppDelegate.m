//
//  TMAppDelegate.m
//  Tough Mudder
//
//  Created by Justin Cohen on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TMAppDelegate.h"
#import "TMExerciseViewController.h"
#import "TMLogViewController.h"

@implementation TMAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize managedObjectModel, managedObjectContext, persistentStoreCoordinator;

- (void)dealloc {
  [_window release];
  [_tabBarController release];  
  [managedObjectContext release];
  [managedObjectModel release];
  [persistentStoreCoordinator release];

  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  TMExerciseViewController* viewController1 = [[[TMExerciseViewController alloc] initWithNibName:@"TMExerciseViewController" bundle:nil] autorelease];
  TMLogViewController* viewController2 = [[[TMLogViewController alloc] initWithNibName:@"TMLogViewController" bundle:nil] autorelease];
  viewController2.managedObjectContext = self.managedObjectContext;
  
  self.tabBarController = [[[UITabBarController alloc] init] autorelease];
  self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
  self.tabBarController.title = @"Tough Mudder";
  UINavigationController* navController = [[[UINavigationController alloc] initWithRootViewController:self.tabBarController] autorelease];
  self.window.rootViewController = navController;
  [self.window makeKeyAndVisible];
  return YES;
}

//Explicitly write Core Data accessors
- (NSManagedObjectContext*)managedObjectContext {
  if (managedObjectContext != nil) {
    return managedObjectContext;
  }
  NSPersistentStoreCoordinator* coordinator = [self persistentStoreCoordinator];
  if (coordinator != nil) {
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:coordinator];
  }
  return managedObjectContext;
}

- (NSManagedObjectModel*)managedObjectModel {
  if (managedObjectModel != nil) {
    return managedObjectModel;
  }
  managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
  return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  if (persistentStoreCoordinator != nil) {
    return persistentStoreCoordinator;
  }
  NSURL* storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                      stringByAppendingPathComponent: @"toughmudder.sqlite"]];
  NSError* error = nil;
  persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                 initWithManagedObjectModel:[self managedObjectModel]];
  if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                 configuration:nil URL:storeUrl options:nil error:&error]) {
    /*Error for store creation should be handled in here*/
  }
  return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
  return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application {
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
