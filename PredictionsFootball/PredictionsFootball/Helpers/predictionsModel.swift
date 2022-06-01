//
//  predictionsModel.swift
//  testFirebase
//
//  Created by Разработчик on 09.04.2020.
//  Copyright © 2020 Разработчик. All rights reserved.
//

class predictionsModel{
    
    var firstTeamScore: String?
    var secondTeamScore: String?
    
    init(firstTeamScore:String?,secondTeamScore:String?) {
        self.firstTeamScore = firstTeamScore;
        self.secondTeamScore = secondTeamScore;
    }
    
}
