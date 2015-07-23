//
//  CategoryCommunicator.h
//  ContatosIP67
//
//  Created by Victor Kurauchi on 7/23/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CategoryCommunicatorDelegate.h"

@protocol CategoryCommunicatorDelegate;

@interface CategoryCommunicator : NSObject

@property (weak, nonatomic) id<CategoryCommunicatorDelegate> delegate;

- (void)listCategories;

@end
