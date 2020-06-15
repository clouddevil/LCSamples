
// 787. Cheapest Flights Within K Stops

class CheapestFlightsWithinKStops {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var fcpEdges: [Int: [(Int, Int)]] = [:]
        for flight in flights {
            let from = flight[0]
            let to = flight[1]
            let w = flight[2]
            fcpEdges[from, default: []].append((to, w))
        }

        var queue: [(Int, Int, Int)] = []
        queue.append((src, 0, 0))
        var weights: [Int: Int] = [:]
        weights[src] = 0

        while !queue.isEmpty {
            let node = queue.removeFirst()
            let key = node.0
            let w = node.1
            let k = node.2

            if k == K + 1 {
                continue
            }

            if let edges = fcpEdges[key] {
                for edge in edges {
                    let ee = edge.0
                    let we = edge.1
                    if weights[ee] == nil || weights[ee]! > w + we {
                        weights[ee] = w + we
                        queue.append((ee, w + we, k + 1))
                    }
                }
            }
        }

        return weights[dst] ?? -1
    }
}
