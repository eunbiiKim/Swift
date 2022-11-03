import Foundation
// markup 모드
// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html
// https://oeepak.tistory.com/227

//:Stored Properties

// MARK: - Stored Properties of Constant Structure

// 구조체의 인스턴스를 상수에 초기화 및 값을 할당하면, 초기화 이후 해당 구조체 인스턴스 안에 할당된 프로퍼티 변수의 값은 수정할 수 없다.
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 // Cannot assign to property: 'rangeOfFourItems' is a 'let' constant
// 구조체가 '값'타입이기 때문. 값타입의 인스턴스가 상수로 선언하면 인스턴스의 모든 프로퍼티에 대해 수정할 수 없다.
// 클래스는 '참조'타입이므로 다르게 동작함. 참조 타입의 인스턴스를 상수로 할당하면 인스턴스의 프로퍼티 변수는 수정 가능.


// MARK: - Lazy Stored Properties

// 처음 사용될 때까지 초기값은 계산되지 않는 프로퍼티임.
// *인스턴스 초기화가 완료된 후에도 초기값이 없기에 var로 선언해야함. let은 초기화가 완료되기 '전에' 항상 값을 가지고 있어야 하므로 lazy로 선언할 수 없음.
// *어떨때 사용하는가?
// - 인스턴스의 초기화가 완료될 때까지 값을 알 수 없는 외부 요인에 인해 '초기값이 달라질때' 유용
// - 프로퍼티의 초기값으로 필요할 때까지 수행하면 안되는 복잡하거나 계산 비용이 많이 드는 경우에도 유용
// *여러 쓰레드에서 동시에 접근되고 프로퍼티가 아직 초기화되지 않은 경우, 프로퍼티가 한번만 초기화 된다는 보장은 없음. -> 여러번 초기화 -> 최종 초기화 값이 달라질 수 도 있다..

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.filename)



//: [Computed Properties](@next)
