//
//  CarTableViewCell.h
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CarTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *carImage;
@property (nonatomic, strong) IBOutlet UILabel *makeLabel;
@property (nonatomic, strong) IBOutlet UILabel *modelLabel;
@end


