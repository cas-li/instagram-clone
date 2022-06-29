//
//  PostCell.m
//  InstagramClone
//
//  Created by Christina Li on 6/29/22.
//

#import "PostCell.h"
#import "Post.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPost:(Post *)post{
    _post = post;

    [self refreshData];

}

-(void)refreshData {
    
    self.caption.text = self.post[@"caption"];
    self.postPicture.file = self.post[@"image"];
    [self.postPicture loadInBackground];
//    self.postPicture.file = self.post.image;
    
//    NSString *at = @"@";
//    self.username.text = [NSString stringWithFormat:@"%@%@", at, self.tweet.user.screenName];

//    self.date.text = self.tweet.createdAtDate.shortTimeAgoSinceNow;
//
//    self.tweetContent.text = self.tweet.text;
    
//    self.postPicture.image = nil;
//    NSString *URLString = self.tweet.user.profilePicture;
//    NSURL *url = [NSURL URLWithString:URLString];
//    NSData *urlData = [NSData dataWithContentsOfURL:url];
//    self.profilePicture.image = [UIImage imageWithData: urlData];
    
//    [self.retweetButton setTitle:[NSString stringWithFormat:@"%d",self.tweet.retweetCount] forState:UIControlStateNormal];
//
//    [self.likesButton setTitle:[NSString stringWithFormat:@"%d",self.tweet.favoriteCount] forState:UIControlStateNormal];
//
//    if (self.tweet.favorited == YES) {
//        [self.likesButton setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateNormal];
//    }
//    else {
//        [self.likesButton setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateNormal];
//    }
//
//    if (self.tweet.retweeted == YES) {
//        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green.png"] forState:UIControlStateNormal];
//    }
//    else {
//        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon.png"] forState:UIControlStateNormal];
//    }
}

@end
