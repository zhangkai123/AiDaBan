//
//  ADCourseCardEditCell.m
//  AiDaBan
//
//  Created by zhang kai on 9/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADCourseCardEditCell.h"

@implementation ADCourseCardEditCell
@synthesize imageView ,desLabel;
-(void)dealloc
{
    [imageView release];
    [desLabel release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 110, 110)];
        imageView.backgroundColor = [UIColor yellowColor];
        [self addSubview:imageView];
        
        desLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 5, 180, 110)];
        desLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:desLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
