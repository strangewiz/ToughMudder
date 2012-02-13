//
//  TMSecondViewController.h
//  Tough Mudder
//
//  Created by Justin Cohen on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMLogViewController : UITableViewController<NSFetchedResultsControllerDelegate> {
  NSFetchedResultsController *fetchedResultsController;
  NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
