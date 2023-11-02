//
//  EventRequirement.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

protocol EventListRequirementProtocol {
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<[Event]>?
}

class EventListRequirement: EventListRequirementProtocol {
let dataRepository: EventRepository
static let shared = EventListRequirement()

init(dataRepository: EventRepository = EventRepository.shared) {
    self.dataRepository = dataRepository
}

func getEventList(limit: Int, offset: Int) async -> ServerResponse<[Event]>? {
    return await dataRepository.getEventList(limit: limit, offset: offset)
}
}
