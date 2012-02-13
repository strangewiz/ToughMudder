//
//  main.m
//  Tough Mudder
//
//  Created by Justin Cohen on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMAppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal = 0;
  @autoreleasepool {
    NSString* classString = NSStringFromClass([TMAppDelegate class]);
    @try {
      retVal = UIApplicationMain(argc, argv, nil, classString);
    }
    @catch (NSException *exception) {
      NSLog(@"Exception - %@",[exception description]);
      exit(EXIT_FAILURE);
    }  
  }
  return retVal;
}
