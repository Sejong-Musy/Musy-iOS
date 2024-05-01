//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription

let project = Project(
    name: "Musy",
    packages: [
        .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.10.1"))
    ],
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "com.Musy.App",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "CreateMusicFeature", path: .relativeToRoot("Projects/FeatureCreateMusic")),
                .project(target: "MusicListFeature", path: .relativeToRoot("Projects/FeatureMusicList")),
                .project(target: "SignInFeature", path: .relativeToRoot("Projects/FeatureSignIn")),
                .project(target: "LoginFeature", path: .relativeToRoot("Projects/FeatureLogin")),
                .project(target: "MainFeature", path: .relativeToRoot("Projects/FeatureMain"))
            ]
        )
    ]
)
