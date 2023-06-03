//
//  OnboardingRootStore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/11.
//

import Foundation

import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboardingRootStore {
    public init() {
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .moveToAuth :
                state.auth = .init()
                state.path.append(.auth)
                return .none
                
            case let .auth(action):
                switch action {
                case .binding:
                    return .none
                case .moveToNextStep :
                    state.permission = .init()
                    state.path.append(.permission)
                }
                return .none
                
            case let .permission(action):
                switch action {
                case .moveToNextStep :
                    state.profile = .init()
                    state.path.append(.profile)
                case .requestHealthKitAuthorization:
                    return .none
                }
                return .none
                
            case let .profile(action):
                switch action {
                case .binding:
                    return .none
                case .setGender:
                    return .none
                case .moveToNextStep :
                    state.profile = .init()
                    state.path.append(.crew)
                }
                return .none
                
            case let .crew(action):
                switch action {
                case .moveToNextStep :
                    state.path.removeAll()
                }
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            onboardingAuthStore: OnboardingAuthStore(),
            onboardingPermissionStore: OnboardingPermissionStore(),
            onboadingProfileStore: OnboadingProfileStore(),
            onboardingCrewStore: OnboardingCrewStore()
        )
    }
}
