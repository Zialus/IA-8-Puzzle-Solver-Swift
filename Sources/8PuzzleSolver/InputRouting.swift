import Foundation

func chooseRoute(_ searchType: Int) {

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
    let timeInterval: Double = end.timeIntervalSince(start)

    print("Elapsed Time: \(timeInterval) seconds")

    print(answer)

    print("Number of moves: \(answer.depth)")

    print("Number of nodes generated: \(generatedNodes)")

    print("Number of nodes that actually got used: \(passedByNodes)")

    answer.printPath()

}
