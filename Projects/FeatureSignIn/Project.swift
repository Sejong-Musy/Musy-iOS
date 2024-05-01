//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription
import ProjectDescriptionHelpers

let interface = Feature.signIn.interface

let testing = Feature.signIn.testing

let feature = Feature.signIn.feature

let tests = Feature.signIn.tests

let example = Feature.signIn.example

let project = Project(
    name: "SignIn",
    targets: [
        interface,
        feature,
        testing,
        tests,
        example
    ]
)
