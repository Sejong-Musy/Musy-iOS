//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription
import ProjectDescriptionHelpers

let interface = Feature.createMusic.interface

let testing = Feature.createMusic.testing

let feature = Feature.createMusic.feature

let tests = Feature.createMusic.tests

let example = Feature.createMusic.example

let project = Project(
    name: "CreateMusic",
    targets: [
        interface,
        feature,
        testing,
        tests,
        example
    ]
)
