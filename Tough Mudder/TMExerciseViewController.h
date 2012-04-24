//
//  TMFirstViewController.h
//  Tough Mudder
//
//  Created by Justin Cohen on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMExerciseViewController : UIViewController {
  IBOutlet UITableView *table_;
  NSMutableArray* exercises_;
  NSTimer* timer_;
  NSUInteger seconds_;
  IBOutlet UILabel* timerLabel_;
}

@property (nonatomic,retain) UITableView *table;

@end
