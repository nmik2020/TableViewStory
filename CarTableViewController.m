//
//  CarTableViewController.m
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CarTableViewController.h"
#import "CarTableViewCell.h"
#import "CarDetailViewController.h"
#import "XMLParser.h"
#import "YOSSocial.h"
#import "Yahoo.h"
#import "OriginalSecret.h"

@interface CarTableViewController ()

@end

@implementation CarTableViewController
@synthesize carMakes = _carMakes; 
@synthesize carModels = _carModels;
@synthesize url = _url;
@synthesize carImage = _carImage;

////////////////////YQL INPUTS
NSString *YQLQuery = @"select * from flickr.photos.search where user_id='11414938@N00' and api_key='9aae7ac1770fdd8027b7aec220ae6400'";
//NSString *YQLQuery2 = @"select * from flickr.photos.info where photo_id=7874621294 and api_key=9aae7ac1770fdd8027b7aec220ae6400";
NSString *ConsumerKey = @"dj0yJmk9N2RRaUxlSkp3ZVBxJmQ9WVdrOVIzWTFOWEpNTXpBbWNHbzlPVEE1TXpNek1EWXkmcz1jb25zdW1lcnNlY3JldCZ4PTI0" ;
NSString *ConsumerSecret = @"5a01aeeac818d12236ff2bba2eadd1dec2eaa5b1";
NSString *ApplicationID = @"Gv55rL30";
bool isStatus=NO;
bool xmlParserStatus;
//////////////////
XMLParser *xmlParser;
Yahoo *yql;
OriginalSecret *getOrg;
int origSecretCount=0;
int i,j=9;
bool allocOriginalSecret;


//}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
       // yql = [[Yahoo alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self sendRequests:YQLQuery];
    self.carMakes = xmlParser.photoid;
    self.carModels = xmlParser.photoid;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
-(void) sendRequests:(id) val  {      
    YOSSession *session = [YOSSession sessionWithConsumerKey:ConsumerKey  
                                           andConsumerSecret:ConsumerSecret  
                                           andApplicationId:ApplicationID];

    xmlParser = [[XMLParser alloc]init];

    YQLQueryRequest *yqlrequest = [YQLQueryRequest   
                                   requestWithSession:session];  
        
    NSString *structuredProfileLocationQuery = [NSString   
                                                stringWithFormat:val];
       [yqlrequest query:structuredProfileLocationQuery  
         withDelegate:self]; 
}  

- (void)requestDidFinishLoading:(YOSResponseData *)data {  
           [xmlParser loadXMLByString:data.responseText];
      [self.tableView reloadData];
      NSLog(@"Photo ID %@",xmlParser.photoid);
    [self getURL :xmlParser.photoid];
        

}  
-(void)getURL:(NSArray *)photoid
{   _url = [[NSMutableArray alloc]init];
    NSLog(@" Inside GET URL's PHOTO ID%@",photoid);
    for (i=0; i<[xmlParser.photoid count]; i++) {
        NSString *myurl = [NSString stringWithFormat: @"http://farm%@.staticflickr.com/%@/%@_%@_q.jpg",[[photoid objectAtIndex:i]valueForKey:@"farm"],[[photoid objectAtIndex:i]valueForKey:@"server"],[[photoid objectAtIndex:i]valueForKey:@"id"],[[photoid objectAtIndex:i]valueForKey:@"secret"]];
        [_url addObject:myurl];
        
    }
    [self.tableView reloadData];
    NSLog(@"URL :%@",_url);
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [xmlParser.photoid count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"carTableCell";
    
    CarTableViewCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CarTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:CellIdentifier];
    }
    
   
    UIImage *carPhoto = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[_url objectAtIndex:indexPath.row]]]];
  
    cell.carImage.image = carPhoto;

    cell.makeLabel.text = [[xmlParser.photoid objectAtIndex:[indexPath row]] valueForKey:@"title"];
    cell.modelLabel.text = [[xmlParser.photoid objectAtIndex:[indexPath row]] valueForKey:@"id"];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCarDetails"])
    {
        CarDetailViewController *detailViewController = 
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView 
                                    indexPathForSelectedRow];
        
        detailViewController.carDetailModel = [[NSMutableArray alloc]
                                               initWithObjects: [[xmlParser.photoid 
                                                                 objectAtIndex:[myIndexPath row]] valueForKey:@"title"],
                                               [[xmlParser.photoid 
                                                 objectAtIndex:[myIndexPath row]] valueForKey:@"id"],
                                               [self.url objectAtIndex:myIndexPath.row],
                                               
                                               nil];
    }
}   

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}

@end
