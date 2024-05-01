//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription

let coreTarget = Target.target(
    name: "Core",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Core",
    sources: ["Sources/**"],
    dependencies: [
        .project(target: "Shared", path: .relativeToRoot("Projects/Shared"))
    ])

let project = Project(
    name: "Core",
    targets: [
        coreTarget
    ]
)
