//
//  CategoryCommunicatorDelegate.h
//  ContatosIP67
//
//  Created by Victor Kurauchi on 7/23/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CategoryCommunicatorDelegate;

@interface CategoryCommunicatorDelegate : NSObject

- (void)receivedCategoriesJSON:(NSData *)objectNotation;
- (void)fetchingCategoriesFailedWithError:(NSError *)error;

@end
