//
//  NetworkError.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case authentication
    case badRequest
    case dataNotDecodable
    case encodingFailure(Error)
    case forwarded(Error)
    case forwardedString(errorString: String)
    case jsonConversionFailure
    case imageDataFailure
    case internalServerError
    case incorrectParameters
    case invalidUrl
    case noConnection
    case noDataReturned
    case outdated
    case unauthorized
    case unknown
}
