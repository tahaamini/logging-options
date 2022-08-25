//
//  ViewController.swift
//  logger_sample
//
//  Created by Taha Amini on 03/08/2022.
//

import UIKit
import os

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        logger(message:"logging related to ads." ,catogery: teams.commerical.rawValue, logType: nil,privacy: .private)
        logger(message:"metering work! logging" ,catogery: teams.apps_experince.rawValue, logType: .error, privacy: .private)
        logger(message:"yay journalism" ,catogery: teams.metering.rawValue, logType: .debug, privacy: .private)
        logger(message: "save for later logging ! ... ", catogery: teams.personalization.rawValue, logType: .info, privacy: .public)
        logger(message: "experince team logging", catogery: teams.journalism.rawValue, logType: .default, privacy: .public)
    }


    // MARK: - Logger struct


    enum teams: String {
        case commerical = "💰 - Commercial"
        case metering =  "Ⓜ️ - Metering"
        case journalism = "📰 - Journalism"
        case personalization = "🎨 - Personalization"
        case apps_experince = "📱 - Apps experince team"

    }

    func logger (message: String, catogery: String, logType: OSLogType?, privacy: OSLogPrivacy) {

        /// Creates a custom logger for logging to a specific subsystem and category.
        /// this will be attached to every message logged by the logger.
        /// subs system is typically a bundle idenitifer which helps to idenitfy a message that comes from your app
        /// catogery is used to distinguish a message.

        // Defining the logger
        let logger = Logger(subsystem: "com.guardian.uk", category: catogery)

        /// the difference between logger.log & logger.print is that the log message is not fully converted to a string as that would be too slow
        /// the complier and the logging library work together to create a *heavily * optiomised representation of the log message.
        /// log messages can contain a wide varity of data types. any types that confroms to custom string convertiable protocol you can add your own type.
        /// when the app logs a message the operating system stores it on the device in a compressed form and you can use the terminal (the log command ) to retrive the logs


        if logType == .info {
            logger.info(" ℹ️ \(message)")
        } else if logType == .error {
            logger.error(" 🐞 \(message)")
        } else if logType == .debug {
            logger.debug(" 🛠 \(message)")
        } else if logType == .fault {
            logger.fault(" ❌ \(message)")
        } else if logType == .default {
            logger.fault(" ⌨️ \(message)")
        } else {
            logger.log(" \(message)")
        }


    }

}



