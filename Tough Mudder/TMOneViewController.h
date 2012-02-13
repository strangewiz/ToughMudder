//
//  TMOneViewController.h
//  Tough Mudder
//
//  Created by Justin Cohen on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMOneViewController : UIViewController {
  IBOutlet UITextView* textView_;
  NSString* content_;
}

- (id)initWithContent:(NSString*)content withName:(NSString*)name;
@end
