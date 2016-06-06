//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        [self resetBoard];
    }

    return self;
}

-(void)resetBoard
{
    self.board = [@[
                                   [@[@"", @"", @""] mutableCopy],
                                   [@[@"", @"", @""] mutableCopy],
                                   [@[@"", @"", @""] mutableCopy]
                                   ] mutableCopy];
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *position = self.board[row][column];
    
    //NSLog(@"\n\n\n\n\n\n\n\n\n\n character at position is: %@", position);
    
    return position;
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{   NSString *position = self.board[row][column];
    
    if (![position isEqualToString:@""]){
        return NO;
    }
    
    //NSLog(@"\n\n\n\n\n\n\n\n\n\n position availability: %@", position);
    
    return YES;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{    //NSString *position = self.board[row][column];
    //if([position isEqualToString:@""]){
    
    if([self canPlayAtColumn:column row:row]){
        self.board[row][column] = @"X";
    }
    
    //NSLog(@"\n\n\n\n\n\n position: %@",self.board);
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{   //NSString *position = self.board[row][column];
    //if([position isEqualToString:@""]){
    
    if([self canPlayAtColumn:column row:row]){
    self.board[row][column] = @"O";
    }
    
    //NSLog(@"\n\n\n\n\n\n position: %@",self.board);
}

-(NSString *)winningPlayer
{ //Horizontal Wins
    if ([self.board[0][0] isEqualToString:self.board[0][1] ] && [self.board[0][0] isEqualToString:self.board[0][2]]){
        return self.board[0][0];
        
    } else if ([self.board[1][0] isEqualToString:self.board[1][1]] && [self.board[1][0] isEqualToString:self.board[1][2]]){
        return self.board[1][0];
        
    }else if ([self.board[2][0] isEqualToString:self.board[2][1]] && [self.board[2][0] isEqualToString:self.board[2][2]]){
        return self.board[2][0];
    }
    
    //Vertical Wins
    else if ([self.board[0][0] isEqualToString:self.board[1][0]] && [self.board[0][0] isEqualToString:self.board[2][0]]){
        return self.board[0][0];
        
    }else if ([self.board[0][1] isEqualToString:self.board[1][1]] && [self.board[0][1] isEqualToString:self.board[2][1]]){
        return self.board[0][1];
        
    }else if ([self.board[0][2] isEqualToString:self.board[1][2]] && [self.board[0][2] isEqualToString:self.board[2][2]]){
        return self.board[0][2];
    }
    
    //Diagonal Wins
    else if ([self.board[0][0] isEqualToString:self.board[1][1]] && [self.board[0][0] isEqualToString:self.board[2][2]]){
        return self.board[0][0];
        
    } else if ([self.board[0][2] isEqualToString:self.board[1][1]] && [self.board[0][2] isEqualToString:self.board[2][0]]){
        return self.board[0][2];
    }
    return @"";
}

-(BOOL)isADraw
{
    for (NSArray *rows in self.board){
        if ([rows containsObject:@""]){
            
            return NO;
    }
    }
    return YES;
}

@end
