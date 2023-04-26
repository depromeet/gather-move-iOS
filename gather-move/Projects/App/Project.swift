//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import DependencyPlugin


let targets: [Target] = [
    .init(
        name: AppModule.name(target: .IOS, micro: .Source),
        platform: .iOS,
        product: .app,
        bundleId: "com.82team.gathermove",
        infoPlist: .extendingDefault(
            with: [
                "CFBundleShortVersionString": "1.0",
                "CFBundleVersion": "1",
                "UILaunchStoryboardName": "LaunchScreen",
                "UIApplicationSceneManifest": [
                    "UIApplicationSupportsMultipleScenes": false,
                    "UISceneConfigurations": []
                ]
            ]),
        sources: "Sources/**",
        dependencies: [
            AppModule.targetDependency(target: .Watch, micro: .Source),
            FeatureModule.targetDependency()
        ]
    ),
    .init(
        name: AppModule.name(target: .Watch, micro: .Source),
        platform: .watchOS,
        product: .watch2App,
        bundleId: "com.82team.gathermove.watchkit",
        infoPlist: .default,
        dependencies: [
            AppModule.targetDependency(target: .WatchExtension, micro: .Source),
        ]
    ),
    .init(
        name: AppModule.name(target: .WatchExtension, micro: .Source),
        platform: .watchOS,
        product: .watch2Extension,
        bundleId: "com.82team.gathermove.watchkit.extension",
        infoPlist: .default,
        sources: ["WatchExtension/Sources/**"],
        dependencies: [
            .project(target: "WatchThirdPartyLib", path: .relativeToRoot("Projects/WatchThirdPartyLib"))
        ]
    )
]

let project: Project = .init(
    name: AppModule.moduleName,
    targets: targets
)
