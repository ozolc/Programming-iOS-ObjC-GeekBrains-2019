//
//  CatCell.m
//  Lesson02
//
//  Created by Maksim Nosov on 21/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "CatCell.h"

@interface CatCell ()

@property (nonatomic, strong) UIImageView *catImageView;
@property (nonatomic, strong) UILabel *catNameLabel;

@end

@implementation CatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.catImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 5, 70, 70)];
        [self.catImageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.catImageView setBackgroundColor:[UIColor lightGrayColor]];
        [self.catImageView.layer setCornerRadius:70 / 2];
        [self.catImageView setClipsToBounds:YES];
        [self.contentView addSubview:self.catImageView];
        
        self.catNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 120,
                                                                      0,
                                                                      120,
                                                                      self.bounds.size.height)];
        [self.catNameLabel setTextAlignment:NSTextAlignmentRight];
        [self.catNameLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightLight]];
        [self.contentView addSubview:self.catNameLabel];
    }
    
    [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.catNameLabel = nil;
    self.catImageView.image = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void)setupCellWithCatName:(NSString*)name {
    [self.catImageView setImage:[UIImage imageNamed:name]];
    [self.catNameLabel setText:name];
}

@end
