//
//  ViewController.h
//  500pwn
//
//  Created by Christopher Sardegna on 1/13/13.
//  Copyright (c) 2013 Christopher Sardegna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UITextField *userURL;
    IBOutlet UITextField *userINT;
    IBOutlet UIActivityIndicatorView *isRunning;

    NSString *ID;
    
}

-(IBAction)buttonDown:(id)sender;

-(NSString *)signUp:(NSString *)username :(NSString *)password;

-(NSString *)voteUp;

-(NSString *)favUp;

-(NSString *)logOut;


@end
