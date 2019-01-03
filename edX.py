# -*- coding: utf-8 -*-
"""
Created on Fri Jun 15 00:15:47 2018

@author: bianl
"""
#  edX, MITx: 6.00.1x
#  Introduction to Computer Science and Programming Using Python  
#  Week 3: Lecture 3
#  Exercise: guess my number

print("Please think of a number between 0 and 100!")
low = 0
high = 100
prompt = ("Enter 'h' to indicate the guess is too high."
          "Enter 'l' to indicate the guess is too low."  
          "Enter 'c' to indicate I guessed correctly.")
while True:
    mid = int((low + high)/2.0)
    
    print("Is your secret number " + str(mid) + " ?")
    ans = input(prompt)
 
    if ans == "c":
        print("Game over. Your secret number was: " +  str(mid))
        break
    elif ans ==  "l":
        low = mid
    elif ans == "h":
        high = mid
    else :print("Sorry, I did not understand your input.")
        
            