//
//  PostCell.h
//  InstagramClone
//
//  Created by Christina Li on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@import Parse;

@interface PostCell : UITableViewCell

@property (strong, nonatomic) Post *post;

@property (strong, nonatomic) IBOutlet PFImageView *postPicture;

@property (weak, nonatomic) IBOutlet UILabel *caption;


@end

NS_ASSUME_NONNULL_END
