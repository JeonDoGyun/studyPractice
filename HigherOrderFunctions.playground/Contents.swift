import UIKit

// forEach, map, filter, reduce
var numbers = Array(1...100)
var doubledNumbers: [Int] = []
var higherThanFifty: [Int] = []
var sum = 0

/*
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
