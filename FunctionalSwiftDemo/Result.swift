//
//  Result.swift
//  FunctionalSwiftDemo
//
//  Created by Jeremy Conkin on 3/27/17.
//  Copyright © 2017 JeremyConkin. All rights reserved.
//

import Foundation


/// A result functions like an optional, but instead of a value of nil you get a
/// value or an error
///
/// - Success: Success contains the value
/// - Failure: Failure contains the error
public enum Result<T> {
    case Success(T)
    case Failure(NSError)

    func map<U>(_ f : (T) -> U) -> Result<U> {
        switch self {
        case .Success(let value):
            return .Success(f(value))
        case .Failure(let error):
            return Result<U>.Failure(error)
        }
    }

    func flatMap<U>(_ f: (T) -> Result<U>) -> Result<U> {
        switch self {
        case .Success(let value):
            return f(value)
        case .Failure(let error):
            return Result<U>.Failure(error)
        }
    }
}

func isSuccessful<T>(_ result: Result<T>) -> Bool {
    switch result {
    case .Success(_):
        return true
    default:
        return false
    }
}
