//
//  CarDetailViewController.h
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarDetailViewController : UIViewController
@property (strong, nonatomic) NSArray *carDetailModel;
@property (strong, nonatomic) IBOutlet UILabel *makeLabel;
@property (strong, nonatomic) IBOutlet UILabel *modelLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
