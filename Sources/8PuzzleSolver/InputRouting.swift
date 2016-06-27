//
//  Input.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/27/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func chooseRoute(_ searchType: Int)->() {

    let start = Date()

    //TOTAL HACK I KNOW BUT I DONT CARE
    var answer = firstState
    //TOTAL HACK I KNOW BUT I DONT CARE

    switch searchType {
    case 1:
        print("You Selected: Depth First Search")
        answer = depthFirstSearch()
    case 2:
        print("You Selected: Breadth First Search")
        answer = breadthFirstSearch()
    case 3:
        print("You Selected: Iterative DFS")
        answer = iterativeDepthFirstSearch()
    case 4:
        print("You Selected: Greedy Search")
        answer = greedySearch()
    case 5:
        print("You Selected: A Star Search")
        answer = aStarSearch()
    case 6:
        print("You Selected: Depth Limited Depth First Search")
        answer = depthLimitedDepthFirstSearch()
    case 7:
        print("You Selected: IDA*")
        answer = IDASTAR()
    default:
        print("The number you selected is not associated with any search option")
    }


    print("I FOUND THE ANSWER!!!")
    print()

    let end = Date()
//
//    let diffDateComponents = NSCalendar.currentCalendar().components(
//        [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond],
//        fromDate: start, toDate: end, options: NSCalendarOptions.init(rawValue: 0))
//
//    print("The search took: \(diffDateComponents.year) years, \(diffDateComponents.month) months,\(diffDateComponents.day) days,\(diffDateComponents.hour) hours, \(diffDateComponents.minute) minutes,\(diffDateComponents.second) seconds, \(diffDateComponents.nanosecond) nanoseconds")

    // Difference in seconds
    let timeInterval: Double = end.timeIntervalSince(start)

    print("Elapsed Time: \(timeInterval) seconds");

    print(answer)

    print("Number of moves: \(answer.depth)")

    print("Number of nodes generated: \(generatedNodes)")

    print("Number of nodes that actually got used: \(passedByNodes)")

    answer.printPath()

//    let file = "file.txt" //this is the file. we will write to and read from it
//
//    let text = "some text" //just a text
//
//    if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
//        let path = dir.stringByAppendingPathComponent(file);
//
//        //writing
//        do {
//            try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
//        }
//        catch {/* error handling here */}
//
//        //reading
//        do {
//            let text2 = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
//        }
//        catch {/* error handling here */}
//    }

}