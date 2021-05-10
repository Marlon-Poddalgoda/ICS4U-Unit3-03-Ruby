#!/usr/bin/env ruby

##
# This program generates 250 random numbers in an array
# and allows the user to search the array for a number.
#
# Created by: Marlon Poddalgoda
# Version: 1.0
# Since:   2021-05-09
# frozen_string_literal: true


def binary_search(userArray, userNumber, lowIndex, highIndex)
    # searches for a number

    # if statement
    if lowIndex > highIndex
        return -1
    else
        midIndex = (lowIndex + highIndex) / 2
        if userArray[midIndex] < userNumber
            return binary_search(userArray, userNumber, midIndex + 1, highIndex)
        elsif userArray[midIndex] > userNumber
            return binary_search(userArray, userNumber, lowIndex, midIndex - 1)
        else
            return midIndex
        end
    end
end

puts "Binary Search Program"
puts
begin
    # try statement

    # variables
    counter = 0
    counter2 = 0

    # array
    randomNumArray = Array.new(250)

    # adding numbers to array
    while counter < randomNumArray.length do
        randomNumArray[counter] = rand(0..999)
        counter += 1
    end

    # sorting array
    numberArray = randomNumArray.sort

    # printing sorted numbers
    puts "Sorted list of numbers:"
    while counter2 < numberArray.length do
        print "#{numberArray[counter2]}, "
        counter2 += 1
    end
    puts
    puts

    # getting user input
    print "Enter a number to search for (0-999): "

    # Gets the user input as an int
    userInput = Integer(gets) rescue false

    # making sure the user inputted an appropriate integer
    if userInput > 999 || userInput < 0
        StandardError()
    else
        searchResult = binary_search(numberArray, userInput, 0, numberArray.length - 1)
    end

    # output
    if searchResult == -1
        puts
        puts "Sorry, that number isn't in the list."
    else
        puts
        puts "Your number is in index: #{searchResult}"
    end

rescue StandardError
    # error catch, if user input cannot be converted to int
    puts
    puts "Sorry, that's not a number. Please try again."
end

puts
puts "Done."
