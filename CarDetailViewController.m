//
//  CarDetailViewController.m
//  TableViewStory
//
//  Created by qbadmin on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController ()

@end

@implementation CarDetailViewController
@synthesize makeLabel = _makeLabel;
@synthesize modelLabel = _modelLabel;
@synthesize imageView = _imageView;
@synthesize carDetailModel = _carDetailModel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.makeLabel.text = [self.carDetailModel objectAtIndex:0];
    self.modelLabel.text = [self.carDetailModel objectAtIndex:1];
    self.imageView.image = [UIImage imageNamed: 
                            [self.carDetailModel objectAtIndex:2]];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
