//
//  ViewController.m
//  CameraTest
//
//  Created by KenUchida on 2019/02/24.
//  Copyright © 2019 KenUchida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onPhotoLibrary:(id)sender {
//    NSLog(@"authorizationStatus = %ld", [PHPhotoLibrary authorizationStatus]);
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}
- (IBAction)onPhotoCamera:(id)sender {
}


UIImage* imageTransform(UIImage* image,float rotate)
{
    CGSize imgSize = {image.size.width, image.size.height};

    UIGraphicsBeginImageContext(imgSize);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, image.size.width/2, image.size.height/2);
//    CGContextScaleCTM(context, 1.0, -1.0);
    float radian = rotate * M_PI / 180;
    CGContextRotateCTM(context, radian);
    CGContextDrawImage(context,
        CGRectMake(-image.size.width/2, -image.size.height/2, image.size.width, image.size.height),
        image.CGImage);

    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    /*
     UIImagePickerControllerMediaType
     UIImagePickerControllerOriginalImage
     UIImagePickerControllerReferenceURL
     UIImagePickerControllerImageURL
     */


    image = imageTransform(image,90);

    _imageView.image = image;


    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
