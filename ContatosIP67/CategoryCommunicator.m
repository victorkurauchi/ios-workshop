//
//  CategoryCommunicator.m
//  ContatosIP67
//
//  Created by Victor Kurauchi on 7/23/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "CategoryCommunicator.h"

@implementation CategoryCommunicator

-(void)listCategories {
    NSString *urlAsString = [NSString stringWithFormat:@"http://localhost:4000/api/categories"];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingCategoriesFailedWithError:error];
        } else {
            [self.delegate receivedCategoriesJSON:data];
        }
    }];
}

@end
