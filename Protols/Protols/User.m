//
//  User.m
//  Protols
//
//  Created by zhz on 13/02/2017.
//  Copyright © 2017 zhz. All rights reserved.
//

#import "User.h"

@interface User () <UserDelegate>

@property (nonatomic, strong) NSPointerArray *delegates;

@end
@implementation User

static User *user = nil;
+ (instancetype)shareUser {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[User alloc] init];
        user.delegates = [NSPointerArray weakObjectsPointerArray];
        
        user.delegate = user;
    });
    return user;
}

- (void)addUserDelegate:(id<UserDelegate>)delegate {
    if (!delegate) {
        return;
    }
    [user.delegates compact];
    [user.delegates addPointer:(__bridge void*)delegate];
}

- (void)removeUserDelegate:(id<UserDelegate>)delegate {
    [user.delegates compact];
    if (delegate) {
        NSInteger delegateIndex = 0;
        BOOL flag = NO;
        for (NSInteger i = 0; i < user.delegates.count; i++) {
            void *del = [user.delegates pointerAtIndex:i];
            if (del == (__bridge void*)delegate) {
                delegateIndex = i;
                flag = YES;
                break;
            }
        }
        if (flag) {
            [self.delegates removePointerAtIndex:delegateIndex];
        }
    }
}

- (void)run {
    for (id<UserDelegate>delegate  in self.delegates) {
        if ([delegate respondsToSelector:@selector(log)]) {
            [delegate log];
        }
    }
}

@end
