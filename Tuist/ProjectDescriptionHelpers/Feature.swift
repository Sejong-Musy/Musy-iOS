//
//  File.swift
//  Manifests
//
//  Created by 김도형 on 5/1/24.
//

import ProjectDescription

public enum Feature: String, CaseIterable {
    case createMusic = "CreateMusic"
    case musicList = "MusicList"
    case signIn = "SignIn"
    case login = "Login"
    case main = "Main"
    
    public var interface: Target {
        var anotherFeature: [TargetDependency] {
            switch self {
            case .createMusic:
                return []
            case .login:
                return [
                    .project(target: "\(Feature.signIn.rawValue)Interface", path: .relativeToRoot("Projects/FeatureSignIn"))
                ]
            case .main:
                return [
                    .project(target: "\(Feature.login.rawValue)Interface", path: .relativeToRoot("Projects/FeatureLogin")),
                    .project(target: "\(Feature.createMusic.rawValue)Interface", path: .relativeToRoot("Projects/FeatureCreateMusic")),
                    .project(target: "\(Feature.musicList.rawValue)Interface", path: .relativeToRoot("Projects/FeatureMusicList"))
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
            sources: ["Interface/Sources/**"],
            dependencies: [
                .project(target: "Domain", path: .relativeToRoot("Projects/Domain")),
            ] + anotherFeature)
        
        return interface
    }
    
    public var testing: Target {
        let testing = Target.target(
            name: "\(self.rawValue)Testing",
            destinations: [.iPhone, .iPad],
            product: .staticLibrary,
            bundleId: "com.Musy.\(self.rawValue).testing",
            sources: ["Testing/Sources/**"],
            dependencies: [
                .target(interface)
            ])
        
        return testing
    }
    
    public var feature: Target {
        let feature = Target.target(
            name: "\(self.rawValue)Feature",
            destinations: [.iPhone, .iPad],
            product: .staticFramework,
            bundleId: "com.Musy.\(self.rawValue).feature",
            sources: ["Feature/Sources/**"],
            dependencies: [
                .target(interface)
            ])
        
        return feature
    }
    
    public var tests: Target {
        let tests = Target.target(
            name: "\(self.rawValue)Tests",
            destinations: [.iPhone, .iPad],
            product: .unitTests,
            bundleId: "com.Musy.\(self.rawValue).tests",
            sources: ["Tests/Sources/**"],
            dependencies: [
                .target(testing),
                .target(feature)
            ])
        
        return tests
    }
    
    public var example: Target {
        let example = Target.target(
            name: "\(self.rawValue)Example",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "com.Musy.\(self.rawValue).example",
            sources: ["Example/Sources/**"],
            dependencies: [
                .target(feature),
                .target(testing)
            ])
        
        return example
    }
}
