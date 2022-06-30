//
//  DetailsViewController.m
//  InstagramClone
//
//  Created by Christina Li on 6/29/22.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (strong, nonatomic) IBOutlet PFImageView *postPicture;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UILabel *caption;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.caption.text = self.post[@"caption"];
    self.postPicture.file = self.post[@"image"];
    [self.postPicture loadInBackground];
    
//    self.timestamp.text = self.post[@"createdAt"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    // Configure the input format to parse the date string
//    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
//    // Convert String to Date
//    NSDate *date = [formatter dateFromString:createdAtOriginalString];
//    self.createdAtDate = date;
//    // Configure output format
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
//    // Convert Date to String
    self.timestamp.text = [formatter stringFromDate:self.post[@"createdAt"]];
    NSLog(@"Value of createdAt = %@", self.post[@"createdAt"]);
    NSLog(@"Value of timestamp = %@", self.timestamp.text);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
