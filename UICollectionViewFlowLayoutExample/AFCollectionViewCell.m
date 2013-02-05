//
//  AFCollectionViewCell.m
//  UICollectionViewFlowLayoutExample
//
//  Created by Ash Furrow on 2013-02-05.
//  Copyright (c) 2013 Ash Furrow. All rights reserved.
//

#import "AFCollectionViewCell.h"

@interface AFCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AFCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)), 5, 5)];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.contentView addSubview:self.imageView];
    
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

-(void)prepareForReuse
{
    [self setImage:nil];
}

-(void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

@end
