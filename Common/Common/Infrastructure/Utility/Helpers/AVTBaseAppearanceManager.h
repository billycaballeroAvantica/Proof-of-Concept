//
//  AVTBaseAppearanceManager.h
//  Common
//
//  Created by Alex Gutierrez on 1/25/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVTBaseAppearanceManager : NSObject

+ (instancetype)sharedManager;

- (void)setAppearance;

@end
