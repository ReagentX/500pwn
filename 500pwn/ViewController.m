//
//  ViewController.m
//  500pwn
//
//  Created by Christopher Sardegna on 1/13/13.
//  Copyright (c) 2013 Christopher Sardegna. All rights reserved.
//

#import "ViewController.h"
#import "HTMLNode.h"
#import "HTMLParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

-(IBAction)buttonDown:(id)sender{
    
    NSUInteger index = [[userURL text] rangeOfString:@"/" options:NSBackwardsSearch].location;
    ID =[[userURL text]substringFromIndex:index+1];
    NSLog(ID);
    
    for (int count = 1; count <= [[userINT text] intValue]; count++) {
        
              
        
        NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
        NSMutableString *s = [NSMutableString stringWithCapacity:10];
        for (NSUInteger i = 0U; i < 10; i++) {
            u_int32_t r = arc4random() % [alphabet length];
            unichar c = [alphabet characterAtIndex:r];
            [s appendFormat:@"%C", c];
        }
        
        NSURL *setupURLReq = [NSURL URLWithString:@"https://500px.com/signup"];
        NSString *html=[NSString stringWithContentsOfURL:setupURLReq encoding:NSUTF8StringEncoding error:nil];
        NSError *error = nil;
        
        HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:&error];
        
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        HTMLNode *bodyNode = [parser body];
        NSString *auth = [[bodyNode findChildWithAttribute:@"name" matchingName:@"authenticity_token" allowPartial:NO] getAttributeNamed:@"value"];
        
        NSString *username = [NSString stringWithFormat:@"%@@gmail.com",s];
        NSLog(username);
        NSLog(auth);
        NSLog([self signUp:username :@"password" :auth]);
        
        NSLog([self voteUp]);
//        NSLog([self favUp]);
        NSLog([self logOut]);
        
    }
}


-(NSString *)signUp:(NSString *)username :(NSString *)password :(NSString *)auth{

    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://500px.com/signup"]];
    [request setHTTPMethod:@"POST"];
    
    NSString *post =[[NSString alloc] initWithFormat:@"user[email]=%@&user[password]=%@&authenticity_token=%@",username,password,auth];
    [request setHTTPBody:[post dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *returnstring = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    return returnstring;
}

-(NSString *)voteUp{
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://500px.com/photo/vote/%@?vote=1",ID]]];

    //    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://500px.com/photo/vote/25530637?vote=1"]];
    [request setHTTPMethod:@"POST"];

    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *returnstring = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    return returnstring;
}

-(NSString *)favUp{

    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://500px.com/photo/%@/favorite",ID]]];
//    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://500px.com/photo/25530637/favorite"]];
    [request setHTTPMethod:@"POST"];
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *returnstring = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    return returnstring;
    
}

-(NSString *)logOut{

    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://500px.com/logout"]];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *returnstring = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    return returnstring;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
