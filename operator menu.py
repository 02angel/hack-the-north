# -----------------------------------------------------------------------------
# Name:        Assignment 1(Assignment1.py)
# Purpose:     This is a program created to perform tasks for the user using menus
#
# Author:      Angel Li (588849)
# Created:     29-Mar-19
# Updated:     5-Apr-19
# -----------------------------------------------------------------------------
# defining a function that reverses an inputted string
def reverseString(inputString):
    '''
    Reverses a string

    Function accepts a sentence or a word and then reverses the characters

    Parameters
    ----------
    inputString : string
      The inputString is the sentence or word inputted.

    Returns
    -------
    string
    Reversed string or invalid input message
    '''
    # assert isinstance(inputString, str), "Input should be a word or sentence"
    return inputString[::-1]


# assert reverseString (hi) == ih, 'The reversed string should be ih'
# assert reverseString (computer) == retupmoc, 'The reversed string should be retupmoc'
# assert reverseString (hello world) == dlrow olleh, 'The reversed string should be dlrow olleh'
# defining a function that counts the number of vowels in a string
def countVowel(inputString):
    '''
   Counts the number of vowels in a string

    Function accepts a sentence or a word and then counts and prints the number of vowels (vowels are a, e, i, o, u, and y)

    Parameters
    ----------
    inputString : string
      The inputString is the sentence or word inputted.

    Returns
    -------
    int/string
    Number of vowels or invalid input message
    '''
    # assert isinstance(inputString, str), "Input should be a word or sentence"
    count = 0
    vowels = set('aeiouyAEIOUY')
    for c in vowels:
        count += str(inputString).count(c)
    return count


# assert countVowel (hello world) == 3, 'The number of vowels is 3'
# assert countVowel (hi) == 1, 'The number of vowels is 1'
# assert countVowel (computer) == 3, 'The number of vowels is 3'
# defining a function that determines whether or not a word is a palindrome
def palindrome(inputString):
    '''
    Determines whether or not a word is a palindrome

    Function accepts a word and then determines whether or not it is a palindrome (a palindrome is the same word when read forwards and backwards)

    Parameters
    ----------
    inputString : string
      The inputString is the word inputted.

    Returns
    -------
    string
    Reversed string or invalid input message
    '''
    # assert isinstance(inputString, str), "Input should be a word"
    reString = reverseString(inputString)
    if (reString == inputString):
        return "Your word is a palindrome"
    else:
        return "Your word is not a palindrome"


# assert palindrome (hello) == "Your word is not a palindrome"
# assert palindrome (racecar) == "Your word is a palindrome"
# defining a function that calculates pi
def caculatePi(inputNumber):
    '''
    Calculates pi to an accuracy based on the user's input

    Function accepts a number and then calculates pi. The larger the user's input, the more accurate the value will be.

    Parameters
    ----------
    inputNumber : int
      The inputNumber is the number inputted.

    Returns
    -------
    integer
    Value of pi or invalid input message
    '''
    # assert isinstance(int(inputNumber), int), "Input should be a number"
    if (str(inputNumber).isdigit() != True):
        return "input is not a positive integer"
    # Gregory–Leibniz series
    sign = 1
    pi = 0.0;
    for i in range(1, int(inputNumber)):
        if (sign == 1):
            pi += float(1) / float(2 * i - 1)
            sign = 0
        else:
            pi -= float(1) / float(2 * i - 1)
            sign = 1
    pi *= 4
    return pi


# defining a function that checks whether or not a number is prime
def isPrimeNumber(number):
    '''
    Checks if number is a prime number

    Function checks every single number to see whether or not it is a prime number

    Parameters
    ----------
    inputNumber : int
      The number is a natural number.

    Returns
    -------
    integer
    Value of pi or invalid input message
    '''
    # assert isinstance(number, int)
    if number > 1:
        for i in range(2, (number // 2) + 1):
            if ((number % i) == 0):
                return False
        return True
    else:
        return False


# assert isPrimeNumber (3) == True, 'The number is prime'
# assert isPrimeNumber (6) == False, 'The number is not prime'
# assert isPrimeNumber (61) == True, 'The number is prime'
# defining a function that finds the nth prime number
def findPrimeNumber(inputNumber):
    '''
    Calculates the nth prime number

    Function accepts a number and then calculates the nth prime number. If the user inputs 3, the function will output 5.

    Parameters
    ----------
    number : int
      The number is the number inputted.

    Returns
    -------
    integer
    The nth prime number or invalid input message
    '''
    # assert isinstance(int(inputNumber), int), "Input should be a number"
    if (str(inputNumber).isdigit() != True):
        return "input is not a positive integer"
    count = 0
    number = 0
    while (count < int(inputNumber)):
        number += 1
        if (isPrimeNumber(number)):
            count += 1
    return number


# assert findPrimeNumber (1) == 2, 'The first prime number is 2'
# assert findPrimeNumber (4) == 7, 'The fourth prime number is 7'
# assert findPrimeNumber (10) == 29, 'The tenth prime number is 29'
# defining a function that determines whether or not a number is happy
def isHappyNumber(number):
    '''
    Determines whether or not a number is a happy number

    Function checks if the number is a happy number.

    Parameters
    ----------
    number : int
      The number is a natural number starting from 1.

    Returns
    -------
    boolean
    True (if the number is happy) or false (if the number is unhappy)
    '''
    # assert isinstance(number, int)
    summation = 0
    num = number
    while ((summation != 1) and (summation != 4)):
        summation = 0
        while (num > 0):
            temp = num % 10
            summation += (temp * temp)
            num = num // 10
        num = summation
    if (summation == 1):
        return True
    else:
        return False


# assert isHappyNumber (1) == True, '1 is a happy number'
# assert isHappyNumber (7) == True, '7 is a happy number'
# assert isHappyNumber (4) == False, '4 is not a happy number'
# defining a function that finds the nth happy number
def findHappyNumber(inputNumber):
    '''
    Calculates the nth happy number

    Function accepts a number and then calculates the nth happy number. A happy number is defined by adding the squares of its digits over and over again until it reaches 1.

    Parameters
    ----------
    number : int
      The number is the number inputted.

    Returns
    -------
    integer
    The nth happy number or invalid input message
    '''
    # assert isinstance(int(inputNumber), int), "Input should be a number"
    if (str(inputNumber).isdigit() != True):
        return "input is not a positive integer"
    count = 0
    number = 0
    while (count < int(inputNumber)):
        number += 1
        if (isHappyNumber(number)):
            count += 1
    return number


# assert findHappyNumber (1) == 1, '1 is the first happy number'
# assert findHappyNumber (10) == 44, '44 is the tenth happy number'
# assert findHappyNumber (5) == 19, '19 is the fifth happy number'
while True:
    # Determining if the user wants to perform a math operation or an english operation
    userAnswer = str(input(
        "Would you like to perform 1. a math operation or 2. an english operation? Enter 0 or 'exit' to exit the menu"))

    # Math menu options
    if userAnswer.lower() == str("math") or userAnswer == "1" or userAnswer == "1.":
        while True:
            print("""Choose an option below: 
      1. Calculate pi using the Leibniz formula (the larger your input, the more accurate it will be!)
      2. Calculate the nth prime number
      3. Calculate the nth happy number
      0. Exit""")
            # input variable
            mathInput = int(input())
            # exit program if user enters 0
            if mathInput == 0:
                break;
            # calculate pi if user inputs 1
            if mathInput == 1:
                returnValue = caculatePi(input("Please input a number"))
                print(returnValue)
            # calculate the nth prime number if user inputs 2
            elif mathInput == 2:
                returnValue = findPrimeNumber(input("Please input a number"))
                print(returnValue)
            # calculate the nth happy number if user inputs 3
            elif mathInput == 3:
                returnValue = findHappyNumber(input("Please input a number"))
                print(returnValue)
            # if user inputs a number that is not between 0 and 3, display error message
            else:
                print("Please input a number between 0 and 3")

    # English menu options
    elif userAnswer.lower() == str("english") or userAnswer == "2" or userAnswer == "2.":
        while True:
            print("""Choose an option below: 
      1. Reverse inputted sentence or word
      2. Calculate the number of vowels in a sentence or word
      3. Is your word a palindrome?
      0. Exit""")
            # Input variable
            englishInput = int(input())
            # Break loop if user inputs 0
            if englishInput == 0:
                break
            # Call function to reverse string if user inputs 1
            if englishInput == 1:
                returnValue = reverseString(input("Please input a word or a sentence"))
                print(returnValue)
            # Call function to count vowels if user inputs 2
            elif englishInput == 2:
                returnValue = countVowel(input("Please input a word or a sentence"))
                print(returnValue)
            # Call function to determine whether or not the inputted word is a palindrome if user inputs 3
            elif englishInput == 3:
                returnValue = palindrome(input("Please input a word"))
                print(returnValue)
            else:
                print("Please input a number between 0 and 3")

    elif userAnswer.lower() == str("exit") or userAnswer == "0" or userAnswer == "0.":
        break
    # Print error message if user does not input english or math
    else:
        print("Please input one of the two options above")