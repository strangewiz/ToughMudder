//
//  TMOneViewController.m
//  Tough Mudder
//
//  Created by Justin Cohen on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TMOneViewController.h"

@implementation TMOneViewController

- (id)initWithContent:(NSString*)content withName:(NSString*)name {
    self = [super initWithNibName:@"TMOneViewController" bundle:nil];
    if (self) {
      content_ = content;
      self.title = name;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  textView_.text = content_;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
