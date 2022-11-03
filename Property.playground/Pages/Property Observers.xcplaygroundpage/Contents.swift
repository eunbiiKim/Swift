//:[Computed Properties](@previous)
//:# Property Observers

//:프로퍼티의 값이 변경되었는지 '관찰'하고 '응답'힌다. 프로퍼티옵저버는 프로퍼티의 현재 값이 새로운 값과 같더라도 프로퍼티의 값이 설정될 때 호출된다.
/**
 * 정의한 stored properties
 * 상속한 stored properties
 * 상속한 computed properties

 1. 상속한 프로퍼티인 경우, 하위 클래스의 프로퍼티를 재정의하여 프로퍼티옵저버 추가.
 2. 정의한 연산프로퍼티인 경우, 옵저버 대신 setter를 이용하여 값 변경을 관찰하고 응답함.
 3. willSet, didSet 둘중 하나, 혹은 둘 다 정의 가능함.
 
 
 */

import Foundation

class StepCounter {
     var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 1
stepCounter.totalSteps = 2
stepCounter.totalSteps = 3
stepCounter.totalSteps = 4


// willSet은 변경될 값을 newValue로 받음
// didSet은 변경되지 전의 값을 oldValue로 받음


//: [Next](@next)
