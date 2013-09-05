//
//  FSViewController.m
//  FSPhotoViewDemo
//
//  Created by Stephen Jin on 8/30/13.
//  Copyright (c) 2013 Stephen Jin. All rights reserved.
//

#import "FSViewController.h"
#import "FSPhotoView.h"

@interface FSViewController ()

@end

@implementation FSViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self setTitle:@"FSPhotoView Demo"];
        [self.tableView setBackgroundColor:[UIColor clearColor]];
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row?205:305;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }else {
        while ([cell.contentView.subviews lastObject] != nil)
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    
    if (indexPath.row == 0) {
        
        for (int i = 0; i < 2; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5+i*(155+2.5), 0, 152.5, 300)];
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            [imageView setClipsToBounds:YES];
            [imageView setUserInteractionEnabled:YES];
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"demo_pic%d",i+1]]];
            [cell.contentView addSubview:imageView];
            
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(tapClickAction:)];
            [imageView addGestureRecognizer:tapGes];
            [tapGes release];

            [imageView release];
        }

    }else {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 310, 200)];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setClipsToBounds:YES];
        [imageView setUserInteractionEnabled:YES];
        [imageView setImage:[UIImage imageNamed:@"demo_pic3"]];
        [cell.contentView addSubview:imageView];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(tapClickAction:)];
        [imageView addGestureRecognizer:tapGes];
        [tapGes release];
        
        [imageView release];
    }
    return cell;
}

- (void)tapClickAction:(UITapGestureRecognizer *)sender {
    [FSPhotoView showImageWithSenderView:(UIImageView*)sender.view];
}

@end
