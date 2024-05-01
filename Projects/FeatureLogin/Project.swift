//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription
import ProjectDescriptionHelpers

let interface = Feature.login.interface

let testing = Feature.login.testing

let feature = Feature.login.feature

let tests = Feature.login.tests

let example = Feature.login.example

let project = Project(
    name: "Login",
    targets: [
        interface,
        feature,
        testing,
        tests,
        example
    ]
)
