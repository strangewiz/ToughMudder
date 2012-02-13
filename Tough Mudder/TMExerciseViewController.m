//
//  TMFirstViewController.m
//  Tough Mudder
//
//  Created by Justin Cohen on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TMExerciseViewController.h"
#import "TMOneViewController.h"

@implementation TMExerciseViewController

- (void)loadExercises {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"exercises" ofType:@"txt"];  
  NSString *exercisesAsTxt = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  NSArray *exercises = [exercisesAsTxt componentsSeparatedByString: @"@"];
  exercises_ = [[NSMutableArray alloc] initWithCapacity:[exercises count]];
  for (NSString* exercise in exercises) {
    [exercises_ addObject:[exercise componentsSeparatedByString:@"#"]];
  }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = NSLocalizedString(@"Exercises", @"Exercises");
      self.tabBarItem.image = [UIImage imageNamed:@"exercises"];
      [self loadExercises];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (NSString*)trim:(NSString*)str {
  return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - Table View Stuff

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
  return exercises_.count; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
  static NSString *CellIdentifier = @"Cell"; 
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
  if (cell == nil) { 
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease]; 
  } 
  
  // Configure the cell. 
  NSString* title = [self trim:[[exercises_ objectAtIndex:indexPath.row] objectAtIndex:0]];
  title = [NSString stringWithFormat:@"%d - %@", indexPath.row+1, title];
  cell.textLabel.text = title;
  return cell; 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString* content = [self trim:[[exercises_ objectAtIndex:indexPath.row] objectAtIndex:1]];
  NSString* name = [self trim:[[exercises_ objectAtIndex:indexPath.row] objectAtIndex:0]];
  TMOneViewController* oneView = [[[TMOneViewController alloc] initWithContent:content withName:name] autorelease];
  [self.navigationController pushViewController:oneView animated:YES];
}

@end
