

// 332. Reconstruct Itinerary

class ReconstructItinerary {
    var result = [String]()
    var targets = [String: [String]]()

    func findItinerary(_ tickets: [[String]]) -> [String] {
        for v in tickets {
            let src = v[0]
            var p = targets[src, default: [String]()]
            p.append(v[1])
            targets[src] = p.sorted(by: >)
        }
        visit("JFK")
        return result.reversed()
    }

    private func visit(_ airport: String) {
        while let s = targets[airport]?.popLast() {
            visit(s)
        }
        result.append(airport)
    }
}

//let v = ReconstructItinerary()
//v.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
//v.findItinerary([["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]])
