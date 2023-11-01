//
//  RespondError.swift
//  MeteoReo3
//
//  Created by Joie Gisele Mukamisha on 10/31/23.
//


import Foundation

enum ResponseError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidURL
}
