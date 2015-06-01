//
//  DetailViewController.m
//  MeetUp
//
//  Created by Alex Santorineos on 5/26/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupLabel;
@property (weak, nonatomic) IBOutlet UIButton *websiteButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = [self.dictionary objectForKey:@"name"];
//    self.descriptionLabel.text = [self.dictionary objectForKey:@"description"];
    self.descriptionLabel.text=[self convertHTML:[self.dictionary objectForKey:@"description"]];
//]];
    self.rsvpLabel.text = [NSString stringWithFormat:@"%@",[self.dictionary objectForKey:@"yes_rsvp_count"]];

  NSDictionary*group = [self.dictionary objectForKey:@"group"];
    self.groupLabel.text = [group objectForKey:@"name"];
    

    


}


-(NSString *)convertHTML:(NSString *)html {

    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:html];

    while (myScanner.isAtEnd == NO) {

        [myScanner scanUpToString:@"<" intoString:NULL] ;

        [myScanner scanUpToString:@">" intoString:&text] ;

        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    //
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return html;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    WebViewController *wVc = segue.destinationViewController;

    wVc.dictioanry = self.dictionary;


}




@end
