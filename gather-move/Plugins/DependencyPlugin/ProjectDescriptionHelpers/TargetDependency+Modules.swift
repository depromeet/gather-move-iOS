//
//  TargetDependency+Modules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/27.
//

import Foundation
import ProjectDescription

public extension TargetDependency {
    static var app: Self {
        return .project(target: AppModule.name, path: .app)
    }
    
    static func app(implements module: AppModule) -> Self {
        return .target(name: AppModule.name + module.rawValue)
    }
}

public extension TargetDependency {
    static var feature: Self {
        return .project(target: FeatureModule.name, path: .feature)
    }
    
    static func feature(implements module: FeatureModule) -> Self {
        return .project(target: FeatureModule.name + module.rawValue, path: .feature(implementation: module))
    }
    
    static func feature(interface module: FeatureModule) -> Self {
        return .target(name: FeatureModule.name + module.rawValue + "Interface")
    }
    
    static func feature(tests module: FeatureModule) -> Self {
        return .target(name: FeatureModule.name + module.rawValue + "Tests")
    }
    
    static func feature(testing module: FeatureModule) -> Self {
        return .target(name: FeatureModule.name + module.rawValue + "Testing")
    }
}

public extension TargetDependency {
    static var domain: Self {
        return .project(target: DomainModule.name, path: .domain)
    }
    
    static func domain(implements module: DomainModule) -> Self {
        return .project(target: DomainModule.name + module.rawValue, path: .domain(implementation: module))
    }
    
    static func domain(interface module: DomainModule) -> Self {
        return .target(name: DomainModule.name + module.rawValue + "Interface")
    }
    
    static func domain(tests module: DomainModule) -> Self {
        return .target(name: DomainModule.name + module.rawValue + "Tests")
    }
    
    static func domain(testing module: DomainModule) -> Self {
        return .target(name: DomainModule.name + module.rawValue + "Testing")
    }
}

public extension TargetDependency {
    static var core: Self {
        return .project(target: CoreModule.name, path: .core)
    }
    
    static func core(implements module: CoreModule) -> Self {
        return .project(target: CoreModule.name + module.rawValue, path: .core(implementation: module))
    }
    
    static func core(interface module: CoreModule) -> Self {
        return .target(name: CoreModule.name + module.rawValue + "Interface")
    }
    
    static func core(tests module: CoreModule) -> Self {
        return .target(name: CoreModule.name + module.rawValue + "Tests")
    }
    
    static func core(testing module: CoreModule) -> Self {
        return .target(name: CoreModule.name + module.rawValue + "Testing")
    }
}

public extension TargetDependency {
    static var shared: Self {
        return .project(target: SharedModule.name, path: .shared)
    }
    
    static func shared(implements module: SharedModule) -> Self {
        return .project(target: SharedModule.name + module.rawValue, path: .shared(implementation: module))
    }
}

public extension TargetDependency {
    static var watchShared: Self {
        return .project(target: WatchSharedModule.name, path: .watchShared)
    }
    
    static func watchShared(implements module: WatchSharedModule) -> Self {
        return .project(target: WatchSharedModule.name + module.rawValue, path: .watchShared(implementation: module))
    }
}
