//
//  ComposeViewController.m
//  InstagramClone
//
//  Created by Christina Li on 6/28/22.
//

#import "ComposeViewController.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "MBProgressHUD/MBProgressHUD.h"

@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *postPicture;
@property (weak, nonatomic) IBOutlet UITextView *caption;
@property (weak, nonatomic) IBOutlet UILabel *captionHere;


@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *pictureTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImage:)];
    
    [self.postPicture addGestureRecognizer:pictureTapGestureRecognizer];
    [self.postPicture setUserInteractionEnabled:YES];
    
    self.caption.delegate = self;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.captionHere.hidden = (textView.text.length > 0);
}

- (void) didTapImage:(UITapGestureRecognizer *)sender{
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    
//    self.postPicture.image = editedImage;
    [self.postPicture setImage:editedImage];
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didTapPost:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    CGSize imageSize;
    imageSize.width = 500;
    imageSize.height = 500;
    [Post postUserImage:[self resizeImage:self.postPicture.image withSize:imageSize] withCaption:self.caption.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"post succeeded in posting!");
            [self dismissViewControllerAnimated:true completion:nil];
        }
        else {
            NSLog(@"post failed to post");
            NSLog(@"😫😫😫 Error posting: %@", error.localizedDescription);
        }
    }];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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
