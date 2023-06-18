import Foundation

struct TimeModel: Equatable, Comparable, Identifiable {
    static func < (lhs: TimeModel, rhs: TimeModel) -> Bool {
//        var result: Bool
        if lhs.hours < rhs.hours {
            return true
        } else if lhs.hours == rhs.hours && lhs.minutes < rhs.minutes {
            return true
        } else {
            return false
        }
    }

    let id = UUID()
    let hours: Int
    let minutes: Int
}
