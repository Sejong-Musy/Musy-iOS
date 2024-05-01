//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김도형 on 1/10/24.

import ProjectDescription
import ProjectDescriptionHelpers

let interface = Feature.musicList.interface

let testing = Feature.musicList.testing

let feature = Feature.musicList.feature

let tests = Feature.musicList.tests

let example = Feature.musicList.example

let project = Project(
    name: "MusicList",
    targets: [
        interface,
        feature,
        testing,
        tests,
        example
    ]
)
