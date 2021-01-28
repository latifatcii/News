//
//  PersistenceError.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

enum PersistanceError: String, Error {
    case savingError = "Data couldn't be saved"
    case removingError = "Data couldn't be removed"
    case fetchingError = "Data couldn't be fetched"
    case checkingError = "Data couldn't be checked"
}
