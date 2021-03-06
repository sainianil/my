//
//  BankAccount.m
//  FinancePlanning
//
//  Created by Anil Saini on 02/03/16.
//  Copyright © 2016 Anil Saini. All rights reserved.
//

#import "BankAccount.h"
#import "DBManager.h"

static BankAccount *bankAccount = nil;

@interface BankAccount()
{    
}

@end

@implementation BankAccount
@synthesize balance;

+ (id)sharedBankAccount
{
    if(!bankAccount){
        bankAccount = [[BankAccount alloc] init];
        [bankAccount setBalance:[[DBManager sharedDatabaseManager] accountBalance]];
    }
    
    return bankAccount;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    bankAccount = nil;
}

- (void)setBalance:(float)newBalance
{
    balance += newBalance;
    [[DBManager sharedDatabaseManager] updateAccountBalance:balance];
}

@end
