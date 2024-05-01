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
    sources: ["DesignSystem/Sources/**"],
    resources: ["DesignSystem/Resources/**"])

let thirdPartyLibraryTarget = Target.target(
    name: "ThirdPartyLibrary",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Shared.ThirdPartyLibrary",
    sources: ["ThirdPartyLibrary/Sources/**"],
    dependencies: [
        .package(product: "ComposableArchitecture", type: .macro)
    ])

let sharedTarget = Target.target(
    name: "Shared",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Shared",
    sources: ["Sources/**"],
    dependencies: [
        .target(designSystemTarget),
        .target(thirdPartyLibraryTarget)
    ])

let project = Project(
    name: "Shared",
    targets: [
        sharedTarget,
        designSystemTarget,
        thirdPartyLibraryTarget
    ]
)
