//
//  WebViewController.m
//  MeetUp
//
//  Created by Alex Santorineos on 5/26/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *urlString= [self.dictioanry objectForKey:@"event_url"];


    NSURL *url = [NSURL URLWithString:[self.dictioanry objectForKey:@"event_url"]];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:urlRequest];
    
}
- (IBAction)onButtonPressed:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

}



@end
