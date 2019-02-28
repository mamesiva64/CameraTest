//
//  ViewController.m
//  AsyncTest
//
//  Created by KenUchida on 2019/02/27.
//  Copyright © 2019 KenUchida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonRun;

@end

@implementation ViewController{
    bool isStressTestLoop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isStressTestLoop = false;
}

- (IBAction)onButton:(id)sender {
    if(isStressTestLoop){
        [self.buttonRun setTitle:@"WAIT..." forState:UIControlStateNormal];
        [self.buttonRun setEnabled:FALSE];
        isStressTestLoop = false;
        return;
    }
    [self.buttonRun setTitle:@"STOP" forState:UIControlStateNormal];
    isStressTestLoop = true;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        while(self->isStressTestLoop){
            NSLog(@"test");
            [NSThread sleepForTimeInterval:3.0];
        }
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self.buttonRun setTitle:@"START" forState:UIControlStateNormal];
            [self.buttonRun setEnabled:TRUE];
        });
    });
}



@end
