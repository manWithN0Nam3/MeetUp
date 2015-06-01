//
//  ViewController.m
//  MeetUp
//
//  Created by Alex Santorineos on 5/26/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property NSArray *meetUps;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property  NSArray *messageArray;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSString *searchFieldTextResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _messageArray = [NSArray new];
    self.meetUps = [NSMutableArray new];



    NSString *urlString = [NSString stringWithFormat:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=477d1928246a4e162252547b766d3c6d"];

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        //original layer
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        //first layer - array
        self.meetUps = [JSON objectForKey:@"results"];

        [self.tableView reloadData];

        
    }];



}


#pragma mark Search
- (IBAction)searchButtonTapped:(UIButton *)sender {
    self.searchFieldTextResult = self.textField.text;
    [self apiMethod];


}

-(void)apiMethod{


    NSString *urlString = [NSString stringWithFormat:@"https://api.meetup.com/2/open_events.json?zip=60604&text=%@&time=,1w&key=477d1928246a4e162252547b766d3c6d",self.searchFieldTextResult];

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        //original layer
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        //first layer - array
        self.meetUps = [JSON objectForKey:@"results"];

        [self.tableView reloadData];

        
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.meetUps.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne"];
    //2nd layer - dictioanry
    NSDictionary *dictionary = [self.meetUps objectAtIndex:indexPath.row];

    cell.textLabel.text = [dictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [dictionary objectForKey:@"status"];
    
    //3rd layer - dictioanry
    NSDictionary *venue = [dictionary objectForKey:@"venue"];
//    cell.detailTextLabel.text = [venue objectForKey:@"address_1"];

    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


    DetailViewController *dVc = segue.destinationViewController;
    
    dVc.dictionary = [self.meetUps objectAtIndex:_tableView.indexPathForSelectedRow.row];


}
@end
