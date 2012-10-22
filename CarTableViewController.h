//
//  CarTableViewController.h
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarTableViewController : UITableViewController
@property (nonatomic, strong) IBOutlet UIImageView *carImage;

@property (nonatomic, strong) NSMutableArray *carMakes;
@property (nonatomic, strong) NSMutableArray *carModels;
@property (nonatomic, strong) NSMutableArray *url;

-(void)getNextQuery:(NSArray *)photoid;
-(void)getURL:(NSArray *)originalsecret;
@end
