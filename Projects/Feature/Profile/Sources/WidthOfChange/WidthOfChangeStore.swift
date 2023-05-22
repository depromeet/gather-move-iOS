//
//  WidthOfChangeStore.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import ComposableArchitecture

import FeatureProfileInterface

extension WidthOfChangeStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
