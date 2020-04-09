//
//  ToastManager.m
//  test
//
//  Created by madara on 4/8/20.
//
#import <Foundation/Foundation.h>
#import "ToastManager.h"
#import <UIKit/UIKit.h>


@implementation ToastManager
RCT_EXPORT_MODULE();

//+ (NSString *)moduleName {
//  return @"ToastManager";
//}


RCT_EXPORT_METHOD(show:(NSString *)Message time:(float)time) {
  
  UIAlertController * alert=[UIAlertController alertControllerWithTitle:nil
                                                                message:@""
                                                         preferredStyle:UIAlertControllerStyleAlert];

  NSMutableAttributedString *AS = [[NSMutableAttributedString alloc] initWithString:Message];
  [AS addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0,AS.length)];
  [alert setValue:AS forKey:@"attributedTitle"];
  UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
      viewController = viewController.presentedViewController;
  }

  NSLayoutConstraint *constraint = [NSLayoutConstraint
      constraintWithItem:alert.view
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationLessThanOrEqual
      toItem:nil
      attribute:NSLayoutAttributeNotAnAttribute
      multiplier:1
      constant:viewController.view.frame.size.height*2.0f];

  [alert.view addConstraint:constraint];
  dispatch_sync(dispatch_get_main_queue(), ^{
    [viewController presentViewController:alert animated:YES completion:^{}];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:^{
        }];
    });

  });
  
}

@end
