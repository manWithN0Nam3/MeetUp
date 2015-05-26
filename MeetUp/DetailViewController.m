//
//  DetailViewController.m
//  MeetUp
//
//  Created by Alex Santorineos on 5/26/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = [self.dictionary objectForKey:@"name"];
    self.descriptionLabel.text = [self.dictionary objectForKey:@"description"];
    self.rsvpLabel.text = [NSString stringWithFormat:@"%@",[self.dictionary objectForKey:@"yes_rsvp_count"]];
    


}




@end
