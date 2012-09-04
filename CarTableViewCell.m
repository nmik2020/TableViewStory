//
//  CarTableViewCell.m
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CarTableViewCell.h"

@implementation CarTableViewCell
@synthesize makeLabel = _makeLabel;
@synthesize modelLabel = _modelLabel;
@synthesize carImage = _carImage;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
