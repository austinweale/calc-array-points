//
//  Austin Weale
//  calculator for homework 3
//  This program takes in input from the command line or command line arguments
//  when calling the program in order to make simple calculations
//  command line arguments enabled
//

import Foundation


//returns the average of the command-line arguments
//assumes first arg is the program name and the last arg is not used
func average(args: [String], start: Int) {
    let total = args.count - 1 - start
    var commandLineSum = 0
    for i in start...(args.count - 2){
        commandLineSum += Int(args[i])!
    }
    
    print("result: \(commandLineSum / total)")
}

//returns the factorial of the passed-in integer
func factorial(num: Int) -> Int{
    if num == 1 {
        return 1
    }else{
        return num * factorial(num: num - 1)
    }
}

//adds the two passed-in integers
func add(first: Int, second: Int) -> Int{
    return first + second
}

//subtracts the two passed-in integers
func subtract(first: Int, second: Int) -> Int{
    return first - second
}

//multiplies the two passed-in integers
func multiply(first: Int, second: Int) -> Int{
    return first * second
}

//subtracts the two passed-in integers
func divide(first: Int, second: Int) -> Int{
    return first / second
}

//takes in two integers and applies a mathmatic operation to them
func executeOperation(first: Int, second: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(first, second)
}

//if they passed arguments use them
//otherwise take in user input
if (CommandLine.arguments.count > 1){
    var arguments = CommandLine.arguments
    var operation = arguments[arguments.count - 1]
    switch operation {
    case "avg":
        average(args: arguments, start: 1)
    case "count":
        print("result: \(arguments.count - 2)")
    case "fact":
        print("result: \( factorial(num: Int(arguments[1])!) )")
    default:
        print("invalid operation")
    }
} else {
    print("Enter an expression separated by returns:")
    
    var firstInput = readLine(strippingNewline: true)!
    
    var allInput = firstInput.components(separatedBy: " ")
    
    //if they typed a whole expression
    if(allInput.count > 1){
        var arguments = allInput
        var operation = arguments[arguments.count - 1]
        switch operation {
        case "avg":
            average(args: arguments, start: 0)
        case "count":
            print("result: \(arguments.count - 2)")
        case "fact":
            print("result: \( factorial(num: Int(arguments[0])!) )")
        default:
            print("invalid operation")
        }
    }else{
        var first = Int(firstInput)!
        
        var operand = readLine(strippingNewline: true)!
        
        var second = Int(readLine(strippingNewline: true)!)!
        
        switch operand {
        case "+":
            print("result: \(first + second)")
        case "-":
            print("result: \(first - second)")
        case "*":
            print("result: \(first * second)")
        case "/":
            print("result: \(first / second)")
        case "%":
            print("result: \(first % second)")
        default:
            print("not valid input")
        }
    }
}

