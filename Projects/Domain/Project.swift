//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription

let domainTarget = Target.target(
    name: "Domain",
    destinations: [.iPad, .iPhone],
    product: .staticLibrary,
    bundleId: "com.Musy.Domain",
    sources: ["Sources/**"],
    dependencies: [
        .project(target: "Core", path: .relativeToRoot("Projects/Core"))
    ])

let project = Project(
    name: "Domain",
    targets: [
        domainTarget
    ]
)
