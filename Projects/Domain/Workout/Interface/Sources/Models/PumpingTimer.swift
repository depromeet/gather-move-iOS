//
//  WorkoutData.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/18.
//

import Foundation

public struct PumpingTimer: Codable, Equatable {
    public let id: UUID
    public let workoutCategoryIdentifier: WorkoutCategoryIdentifier
    public var time: Int
    
    public var heartRates: [Double]
    public var calorie: Double
    
    public var pinTime: Int
    public var isActive: Bool
    
    public init(
        id: UUID,
        workoutCategoryIdentifier: WorkoutCategoryIdentifier,
        time: Int = 0,
        heartRates: [Double] = [],
        calorie: Double = 0,
        pinTime: Int = 0,
        isActive: Bool = false
    ) {
        self.id = id
        self.workoutCategoryIdentifier = workoutCategoryIdentifier
        self.time = time
        self.heartRates = heartRates
        self.calorie = calorie
        self.pinTime = pinTime
        self.isActive = isActive
    }
}
