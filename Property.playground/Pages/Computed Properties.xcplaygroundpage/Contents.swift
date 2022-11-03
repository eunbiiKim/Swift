//:[Sotred Properties](@previous)

//:# Computed Properties


import Foundation

// 클래스, 구조체, 열거형
// 다른 프로퍼티와 값을 간접적으로 조회
// getter와 옵셔널setter를 제공.

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            print("newCenter: \(newCenter)")
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
// 연산 프로퍼티는 특정값을 저장할 필요가 없고, 항상 계산이 가능한 경우에 사용함.
// getter - 연산식과 초기값을 정의함, 프로퍼티 값을 조회할 때 getter를 호출함.
// setter - 연산프로퍼티에 새로 들어오는 값으로 연산할 것을 정의함

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0) // -> setter의 newCenter의 값이 됨.
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


//:### Shorthand Setter Declaration
//:setter가 새로운 값을 설정하는데 이름을 정의하지 않았다면 'newValue'라는 기본 이름이 사용되고 생략 가능.
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set { // ⬅️ newValue 생략 - newValue는 center의 변경 값을 의미.
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//:### Shorthand Getter Declaration
//:바로 return 할 수 있는 단일 표현식이라면 return을 생략할 수 있음.
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width/2),
                  y: origin.x + (size.width/2))
        }
        set {
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}


//:### Read-Only Computed Properties
//:읽기전용 연산프로퍼티는 setter가 없고 getter만 있다. 읽기전용으로 되어있으면 항상 값을 반환하고 . 구문으로 접근할 수 있지만 setter처럼 다른 값을 설정할 수는 없다.
//:- get 키워드와 중괄호를 삭제하므로 정의
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        width * height * depth
    }
}

var fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

fourByFiveByTwo.depth = 12.0
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


//:[Property Observers](@next)
