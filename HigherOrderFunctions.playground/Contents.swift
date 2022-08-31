import UIKit

let saveDate = "-10"

func isNegativeNumber(string: String) {
    if string.hasPrefix("-") {
        print("negative")
    }
}

isNegativeNumber(string: saveDate)

let dateFormatter = DateFormatter()
dateFormatter.locale = Locale(identifier: "ko_KR")
dateFormatter.timeZone = TimeZone(abbreviation: "KST")

func stringToDate(string: String) -> Date {
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: string) else { fatalError() }
    return date
}

func dayToDate(string: String) -> Date {
    dateFormatter.dateFormat = "dd"
    guard let date = dateFormatter.date(from: string) else { fatalError() }
    return date
}

func calculateDate(startDate: Date) -> Int {
    let s = startDate
    let current = Date()
    return Int(current.timeIntervalSince(s)) / 86400 // 일수 구할 때 86400 나눠야 나옴
}

let currentDate = Date()
let expiryDate = 10
let setDate = stringToDate(string: "2022-08-20")


let periodOfDate = calculateDate(startDate: setDate)

// 오늘날짜에서 저장날짜를 뺴고 남은 수에 유통기한을 빼주면 되네

    
    
/*
// forEach, map, filter, reduce
var numbers = Array(1...100)
var doubledNumbers: [Int] = []
var higherThanFifty: [Int] = []
var sum = 0


print(numbers)

for number in numbers {
    print(number)
}

numbers.forEach { print($0) }
*/

/*
for number in numbers {
    let doubledNumber = number * 2
    doubledNumbers.append(doubledNumber)
}
print(doubledNumbers)

print(numbers.map { $0 * 2 })
*/

/*
for number in numbers where numbers > 50 {
    higherThanFifty.append(number)
}
print(higherThanFifty)
 
print(numbers.filter { $0 > 50 })
 */

/*
for number in numbers {
    sum += number
}

print(numbers.reduce(0) { $0 + $1 }) // 첫번째는 시작값, 두번째는 코드
*/
