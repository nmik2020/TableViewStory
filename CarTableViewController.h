//
//  CarTableViewController.h
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *carImages;
@property (nonatomic, strong) NSMutableArray *carMakes;
@property (nonatomic, strong) NSMutableArray *carModels;


@end