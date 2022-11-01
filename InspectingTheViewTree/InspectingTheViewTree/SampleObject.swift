//
//  SampleObject.swift
//  InspectingTheViewTree
//
//  Created by 남기범 on 2022/11/01.
//

import Foundation
import Combine

final class SampleObject: ObservableObject {
    @UserDefault(key: "sleepGoal", defaultValue: 0)
    var sleepGoal: Double
}

@propertyWrapper
struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
