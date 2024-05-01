//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription
import ProjectDescriptionHelpers

let interface = Feature.main.interface

let testing = Feature.main.testing

let feature = Feature.main.feature

let tests = Feature.main.tests

let example = Feature.main.example

let project = Project(
    name: "Main",
    targets: [
        interface,
        feature,
        testing,
        tests,
        example
    ]
)
