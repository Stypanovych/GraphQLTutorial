//
//  LaunchListAPIExtension.swift
//  GrapthQLTutorial
//
//  Created by Kolya Stypanovych on 02/11/2023.
//

import LaunchListAPI

extension LaunchListAPI.LaunchListQuery.Data {
    func toLaunchListModel() -> LaunchList {
        LaunchList(launches: self.launches.toLaunchesModel())
    }
}

extension LaunchListQuery.Data.Launches {
    func toLaunchesModel() -> Launches {
        Launches(launches: self.launches.toLaunchModel())
    }
}

extension Array where Element == LaunchListAPI.LaunchListQuery.Data.Launches.Launch? {
    func toLaunchModel() -> [Launch?] {
        self.compactMap { launch -> Launch? in
            guard let launch = launch else { return nil }
            return Launch(
                id: launch.id,
                site: launch.site,
                mission: launch.mission?.toMissionModel(),
                rocket: launch.rocket?.toRocketModel(),
                isBooked: launch.isBooked
            )
        }
    }
}

extension LaunchListAPI.LaunchListQuery.Data.Launches.Launch.Mission {
    func toMissionModel() -> Mission {
        Mission(
            name: self.name,
            missionPatch: self.missionPatch
        )
    }
}

extension LaunchListAPI.LaunchListQuery.Data.Launches.Launch.Rocket {
    func toRocketModel() -> Rocket {
        Rocket(
            id: self.id,
            name: self.name,
            type: self.type
        )
    }
}
