//
//  User.h
//  Protols
//
//  Created by zhz on 13/02/2017.
//  Copyright © 2017 zhz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserDelegate <NSObject>

@optional
- (void)log;

- (void)addUserDelegate:(id<UserDelegate>)delegate;

- (void)removeUserDelegate:(id<UserDelegate>)delegate;

//@property (nonatomic, strong) NSMutableArray<id<UserDelegate>> *delegates;

@end

@interface User : NSObject

+ (instancetype)shareUser;

@property (nonatomic, weak) id<UserDelegate> delegate;

- (void)run;

@end
