//
//  WorkoutEndStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutEndStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .completeButtonTapped:
                return .send(.backToRoot)
                
            case let .timerSummaryCells(id, action):
                return .none
                
            case .backToRoot:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
