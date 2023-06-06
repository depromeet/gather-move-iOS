//
//  OnboardingPermissionStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/01.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface
import CoreHealthKitManager

extension OnboardingPermissionStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case.moveToNextStep :
                return .none
            case .requestHealthKitAuthorization:
                HealthKitAuthorizationHelper.shared.checkAuthorizationAndRequest {
                    
                }
                
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
