//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription

let designSystemTarget = Target.target(
    name: "SharedDesignSystem",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Shared.DesignSystem",
    sources: ["Shared/DesignSystem/Sources/**"],
    resources: ["Shared/DesignSystem/Resources/**"])

let thirdPartyLibraryTarget = Target.target(
    name: "SharedThirdPartyLibrary",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Shared.ThirdPartyLibrary",
    sources: ["Shared/ThirdPartyLibrary/Sources/**"],
    dependencies: [
        .package(product: "ComposableArchitecture", type: .macro)
    ])

let sharedTarget = Target.target(
    name: "Shared",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Shared",
    sources: ["Shared/Sources/**"],
    dependencies: [
        .target(designSystemTarget),
        .target(thirdPartyLibraryTarget)
    ])

let coreTarget = Target.target(
    name: "Core",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Core",
    sources: ["Core/Sources/**"],
    dependencies: [
        .target(sharedTarget)
    ])

let domainTarget = Target.target(
    name: "Domain",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Domain",
    sources: ["Domain/Sources/**"],
    dependencies: [
        .target(coreTarget)
    ])

enum Feature: String, CaseIterable {
    case createMusic = "CreateMusic"
    case musicList = "MusicList"
    case signIn = "SignIn"
    case login = "Login"
    case main = "Main"
    
    var interface: Target {
        var anotherFeature: [TargetDependency] {
            switch self {
            case .createMusic:
                return []
            case .login:
                return [
                    .target(name: "\(Feature.signIn.rawValue)Interface")
                ]
            case .main:
                return [
                    .target(name: "\(Feature.login.rawValue)Interface"),
                    .target(name: "\(Feature.createMusic.rawValue)Interface"),
                    .target(name: "\(Feature.musicList.rawValue)Interface")
                ]
            case .musicList:
                return []
            case .signIn:
                return []
            }
        }
        
        let interface = Target.target(
            name: "\(self.rawValue)Interface",
            destinations: [.iPhone, .iPad],
            product: .staticLibrary,
            bundleId: "com.Musy.\(self.rawValue).Interface",
            sources: ["Feature\(self.rawValue)/Interface/Sources/**"],
            dependencies: [
                .target(domainTarget),
            ] + anotherFeature)
        
        return interface
    }
    
    var testing: Target {
        let testing = Target.target(
            name: "\(self.rawValue)Testing",
            destinations: [.iPhone, .iPad],
            product: .staticLibrary,
            bundleId: "com.Musy.\(self.rawValue).testing",
            sources: ["Feature\(self.rawValue)/Testing/Sources/**"],
            dependencies: [
                .target(interface)
            ])
        
        return testing
    }
    
    var feature: Target {
        let feature = Target.target(
            name: "\(self.rawValue)Feature",
            destinations: [.iPhone, .iPad],
            product: .staticFramework,
            bundleId: "com.Musy.\(self.rawValue).feature",
            sources: ["Feature\(self.rawValue)/Feature/Sources/**"],
            dependencies: [
                .target(interface)
            ])
        
        return feature
    }
    
    var tests: Target {
        let tests = Target.target(
            name: "\(self.rawValue)Tests",
            destinations: [.iPhone, .iPad],
            product: .unitTests,
            bundleId: "com.Musy.\(self.rawValue).tests",
            sources: ["Feature\(self.rawValue)/Tests/Sources/**"],
            dependencies: [
                .target(testing),
                .target(feature)
            ])
        
        return tests
    }
    
    var example: Target {
        let example = Target.target(
            name: "\(self.rawValue)Example",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "com.Musy.\(self.rawValue).example",
            sources: ["Feature\(self.rawValue)/Example/Sources/**"],
            dependencies: [
                .target(feature),
                .target(testing)
            ])
        
        return example
    }
}

let featureInterfaces = Feature.allCases.map { $0.interface }
let feautureTesting = Feature.allCases.map { $0.testing }
let features = Feature.allCases.map { $0.feature }
let featureExamples = Feature.allCases.map { $0.example }
let featureTests = Feature.allCases.map { $0.tests }

let appTarget = Target.target(
    name: "MusyApp",
    destinations: .iOS,
    product: .app,
    bundleId: "com.Musy.App",
    infoPlist: .extendingDefault(
        with: [
            "UILaunchStoryboardName": "LaunchScreen.storyboard",
        ]
    ),
    sources: ["App/Sources/**"],
    dependencies: features.map { TargetDependency.target($0) }
)

let project = Project(
    name: "Musy",
    packages: [
        .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.10.1"))
    ],
    targets: featureInterfaces +
    feautureTesting +
    features +
    featureTests +
    featureExamples + [
        appTarget,
        domainTarget,
        coreTarget,
        sharedTarget,
        designSystemTarget,
        thirdPartyLibraryTarget
    ]
)
