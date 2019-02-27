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
    bool stressTestLoop;
    dispatch_queue_t stressTestQueue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    stressTestQueue = NULL;
    stressTestLoop = false;
}

- (IBAction)onButton:(id)sender {
    if(stressTestQueue){
        [self.buttonRun setTitle:@"WAIT..." forState:UIControlStateNormal];
        stressTestLoop = false;
        return;
    }
    [self.buttonRun setTitle:@"STOP" forState:UIControlStateNormal];
    stressTestQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    stressTestLoop = true;
    dispatch_async(stressTestQueue, ^(void) {
        while(stressTestLoop){
            NSLog(@"test");
            [NSThread sleepForTimeInterval:3.0];
        }
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self.buttonRun setTitle:@"START" forState:UIControlStateNormal];
        });
        stressTestQueue = NULL;
    });
}



@end
