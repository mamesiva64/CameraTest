//
//  ViewController.m
//  ApplicationManageSample
//
//  Created by KenUchida on 2019/04/09.
//  Copyright © 2019 KenUchida. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    appDelegate.testData = 100;

}


@end
