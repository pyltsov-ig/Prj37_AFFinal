//
//  Constants.swift
//  Prj37_AFFinal
//
//  Created by ИГОРЬ on 12/06/2021.
//

import Foundation

let initialURL = "https://newsapi.org/v2/everything"
let educationSearchKey = "?q=education"
let apiKey = "&apiKey=f052ce0d1bf94077a06b8f14c5e22dd4"

let apiURL = initialURL+educationSearchKey+apiKey

typealias GetComplete = () -> ()  // сбегающее замыкание для асинхронной обработки
