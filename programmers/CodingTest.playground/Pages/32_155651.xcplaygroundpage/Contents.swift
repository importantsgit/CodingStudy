import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var roomCount = 0

    
    return roomCount
}

extension String {
    func isValidBook(newTime: String?) -> Bool {
        guard let newTime = newTime else { return false }
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        if let cleanRoomTime = format.date(from: self)?.addingTimeInterval(+600),
           let newTime = format.date(from: newTime),
           cleanRoomTime <= newTime{
            print("newTime: \(newTime), cleanRoomTime: \(cleanRoomTime)")
            return true
        }
        return false
    }
}

solution([["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]])

