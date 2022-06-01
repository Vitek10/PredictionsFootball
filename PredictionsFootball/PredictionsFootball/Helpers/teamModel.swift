//
//  teamModel.swift
//  testFirebase
//
//  Created by Разработчик on 07.04.2020.
//  Copyright © 2020 Разработчик. All rights reserved.
//

class teamModel{
    
    var id: String?
    var firstTeam: String?
    var secondTeam: String?
    var firstImage: String?
    var firstTeamResult: String?
    var secondTeamResult: String?
    var dataMatch: String?
    
    init(id:String?,firstTeam:String?,secondTeam:String?, firstImage: String?,firstTeamResult: String?,dataMatch: String?,secondTeamResult:String?) {
        self.id = id;
        self.firstTeam = firstTeam;
        self.secondTeam = secondTeam;
        self.firstImage = firstTeam;
        self.firstTeamResult = firstTeamResult;
        self.dataMatch = dataMatch;
        self.secondTeamResult = secondTeamResult;
    }
    
}
