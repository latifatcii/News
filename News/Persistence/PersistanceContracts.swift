//
//  PersistenceContracts.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

protocol PersistanceContracts {
    
    associatedtype T
    func save(data: T)
    func removeData(with title: String, failed: @escaping (PersistanceError) -> Void)
    func fetchData(completion: @escaping(Result<[T], PersistanceError>) -> Void)
    func checkData(with title: String, completion: @escaping(Result<Bool, PersistanceError>) -> Void)
}
