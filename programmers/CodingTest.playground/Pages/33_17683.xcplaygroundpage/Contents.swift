import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {


    
    var musicinfos = musicinfos
    var result: ([String], Int) = ([], 0)
    let m = m.replaceMusic()

    for musicinfo in musicinfos {
        var musicinfo = musicinfo.split(separator: ",").map{ String($0) }
        var start = musicinfo[0].split(separator: ":").map{ Int($0)! }
        var end = musicinfo[1].split(separator: ":").map{ Int($0)! }
        var musicTime = (end[0] - start[0]) * 60 + end[1] - start[1]
        var infoMusic = musicinfo[3].replaceMusic()
        
        // 만약 기억한 음악의 길이가 방금그곡 서비스 음악이 재생된 길이보다 길다면 조건에 맞지 않음
        // 기억한 음악의 길이는 서비스 음악의 재생된 길이보다 길 수 없음 (재생된 시간 안에 들었던 음악이니)
        if musicTime < m.count { continue }
        
        var music = ""
        for i in 0..<musicTime {
            let idx = infoMusic.index(infoMusic.startIndex, offsetBy: i % infoMusic.count)
            music += String(infoMusic[idx])
        }
        
        if music.contains(m) {
            if result.0.isEmpty == true || result.1 < musicTime {
                result = (musicinfo, musicTime)
            }
            // musicTime이 똑같다면 먼저 재생된 음악이 result -> 먼저 입력된 result가 정답이기 때문에 따로 처리 안함
        }
    }
    return result.0.isEmpty == false ? result.0[2] : "(None)"
    
}

extension String {
    func replaceMusic() -> String {
        return self
            .replacingOccurrences(of: "A#", with: "{")
            .replacingOccurrences(of: "C#", with: "|")
            .replacingOccurrences(of: "D#", with: "~")
            .replacingOccurrences(of: "E#", with: "}")
            .replacingOccurrences(of: "F#", with: "$")
            .replacingOccurrences(of: "G#", with: "^")
    }
}
