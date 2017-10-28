import Foundation

func setupScreen() {
    let message = """
           +-------------------------+
           |  IT'S JOGO DOS 8 TIME!  |
           +-------------------------+

           +------ Input Example ----+
           |                         |
           |          This:          |
           |     1 2 3 4 0 5 6 7 8   |
           |                         |
           |     Turns into this:    |
           |          1 2 3          |
           |          4 _ 5          |
           |          6 7 8          |
           +-------------------------+

    """

    print(message)

    readInitialTable()

    readFinalTable()

}

func readInitialTable() {

    print("Introduce your initial table here: ", terminator: "")
    tryingToReadFirst:
        if let userInput = readLine(strippingNewline: true) {

        var string_table = userInput.split(separator: " ").map(String.init)
        print("Checking Table...")

        if string_table.count != 9 {
            print("BAD INPUT!!!")
            break tryingToReadFirst
        }

        var index = 0
        for i in 0..<3 {
            for j in 0..<3 {
                if let k = Int(string_table[index]) {
                    firstTableFromUser[i][j] = k
                    index+=1
                } else {
                    print("BAD INPUT!!")
                    break tryingToReadFirst
                }
            }
        }

        print("Table Accepted")
    } else {
        print("BAD INPUT!!!")
    }

}

func readFinalTable() {

    print("Introduce your final table here: ", terminator: "")
    tryingToReadFinal:
        if let userInput = readLine(strippingNewline: true) {

        var string_table = userInput.split(separator: " ").map(String.init)
        print("Checking Table...")

        if string_table.count != 9 {
            print("BAD INPUT!!!")
            break tryingToReadFinal
        }

        var index = 0
        for i in 0..<3 {
            for j in 0..<3 {
                if let k = Int(string_table[index]) {
                    finalTableFromUser[i][j] = k
                    index+=1
                } else {
                    print("BAD INPUT!!")
                    break tryingToReadFinal
                }
            }
        }
        print("Table Accepted")

    } else {
        print("BAD INPUT!!!")
    }

}

func searchScreen() -> Int? {

    let message = """
        +----------------------------------+
        |Select the desired search type:   |
        |1) DFS                            |
        |2) BFS                            |
        |3) iDFS                           |
        |4) Greedy                         |
        |5) A*                             |
        |6) Depth Limited DFS              |
        |7) IDA*                           |
        +----------------------------------+

        """
    print(message)
    print("Search Type: ", terminator: "")

    if let searchType = readLine() {
        if let searchType = Int(searchType) {
            return searchType
        } else {
            return nil
        }
    } else {
        return nil
    }

}

func printManhattanInfo() {
    print()
    print("Here is your Initial Table:")
    firstState.prettyPrint()
    print("Here is your Final Table:")
    finalState.prettyPrint()
    print("The Manhattan Distance is: \(getCostTo(firstState.table)) ")
    print()
}
