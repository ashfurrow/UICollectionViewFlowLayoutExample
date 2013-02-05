//
//  AFViewController.m
//  UICollectionViewFlowLayoutExample
//
//  Created by Ash Furrow on 2013-02-05.
//  Copyright (c) 2013 Ash Furrow. All rights reserved.
//

#import "AFViewController.h"

#import "AFCollectionViewFlowLargeLayout.h"
#import "AFCollectionViewFlowSmallLayout.h"
#import "AFCollectionViewCell.h"

@interface AFViewController ()

@property (nonatomic, strong) AFCollectionViewFlowLargeLayout *largeLayout;
@property (nonatomic, strong) AFCollectionViewFlowSmallLayout *smallLayout;
@property (nonatomic, strong) NSArray *images;

@end

static NSString *ItemIdentifier = @"ItemIdentifier";

@implementation AFViewController

-(void)loadView
{
    // Important to override this when not using a nib. Otherwise, the collection
    // view will be instantiated with a nil layout, crashing the app.
    
    self.smallLayout = [[AFCollectionViewFlowSmallLayout alloc] init];
    self.largeLayout = [[AFCollectionViewFlowLargeLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.smallLayout];
    [self.collectionView registerClass:[AFCollectionViewCell class] forCellWithReuseIdentifier:ItemIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Small", @"Large"]];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Interface Methods

-(void)segmentedControlValueDidChange:(id)sender
{
    if (self.collectionView.collectionViewLayout == self.smallLayout)
    {
        [self.largeLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.largeLayout animated:YES];
    }
    else
    {
        [self.smallLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.smallLayout animated:YES];
    }
}

#pragma mark - UICollectionView DataSource & Delegate methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AFCollectionViewCell *cell = (AFCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ItemIdentifier forIndexPath:indexPath];
    
    [cell setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", indexPath.item % 4]]];
    
    return cell;
}

@end
