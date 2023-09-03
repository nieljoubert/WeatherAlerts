//
//  WeatherAlertResponse.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherAlertsResponse = try WeatherAlertsResponse(json)

import Foundation

// MARK: - WeatherAlertsResponse
struct WeatherAlertsResponse: Codable {
//    let context: [ContextElement]?
//    let type: String?
    let features: [Feature]?
//    let title: String?
//    let updated: Date?

//    enum CodingKeys: String, CodingKey {
////        case context = "@context"
//        case type, features, title, updated
//    }
}

// MARK: WeatherAlertsResponse convenience initializers and mutators

extension WeatherAlertsResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherAlertsResponse.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        context: [ContextElement]?? = nil,
        type: String?? = nil,
        features: [Feature]?? = nil,
        title: String?? = nil,
        updated: Date?? = nil
    ) -> WeatherAlertsResponse {
        return WeatherAlertsResponse(
//            context: context ?? self.context,
//            type: type ?? self.type,
            features: features ?? self.features
//            title: title ?? self.title,
//            updated: updated ?? self.updated
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum ContextElement: Codable {
    case contextClass(ContextClass)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(ContextClass.self) {
            self = .contextClass(x)
            return
        }
        throw DecodingError.typeMismatch(ContextElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ContextElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .contextClass(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - ContextClass
struct ContextClass: Codable {
    let version: String?
    let wx, vocab: String?

    enum CodingKeys: String, CodingKey {
        case version = "@version"
        case wx
        case vocab = "@vocab"
    }
}

// MARK: ContextClass convenience initializers and mutators

extension ContextClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ContextClass.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        version: String?? = nil,
        wx: String?? = nil,
        vocab: String?? = nil
    ) -> ContextClass {
        return ContextClass(
            version: version ?? self.version,
            wx: wx ?? self.wx,
            vocab: vocab ?? self.vocab
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Feature
struct Feature: Codable {
    let id: String?
    let type: FeatureType?
    let geometry: Geometry?
    let properties: Properties?
}

// MARK: Feature convenience initializers and mutators

extension Feature {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Feature.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        type: FeatureType?? = nil,
        geometry: Geometry?? = nil,
        properties: Properties?? = nil
    ) -> Feature {
        return Feature(
            id: id ?? self.id,
            type: type ?? self.type,
            geometry: geometry ?? self.geometry,
            properties: properties ?? self.properties
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType?
    let coordinates: [[[Double]]]?
}

// MARK: Geometry convenience initializers and mutators

extension Geometry {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Geometry.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: GeometryType?? = nil,
        coordinates: [[[Double]]]?? = nil
    ) -> Geometry {
        return Geometry(
            type: type ?? self.type,
            coordinates: coordinates ?? self.coordinates
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum GeometryType: String, Codable {
    case polygon = "Polygon"
}

// MARK: - Properties
struct Properties: Codable {
    let id: String?
    let type: TypeEnum?
    let propertiesID, areaDesc: String?
    let geocode: Geocode?
    let affectedZones: [String]?
    let references: [JSONAny]?
    let sent, effective, onset, expires: Date?
    let ends: Date?
    let status: Status?
    let messageType: MessageType?
    let category: Category?
    let severity: Severity?
    let certainty: Certainty?
    let urgency: Urgency?
    let event: String?
    let sender: Sender?
    let senderName, headline, description: String?
    let instruction: String?
    let response: Response?
    let parameters: [String: [String]]?

    enum CodingKeys: String, CodingKey {
        case id = "@id"
        case type = "@type"
        case propertiesID = "id"
        case areaDesc, geocode, affectedZones, references, sent, effective, onset, expires, ends, status, messageType, category, severity, certainty, urgency, event, sender, senderName, headline, description, instruction, response, parameters
    }
}

// MARK: Properties convenience initializers and mutators

extension Properties {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Properties.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        type: TypeEnum?? = nil,
        propertiesID: String?? = nil,
        areaDesc: String?? = nil,
        geocode: Geocode?? = nil,
        affectedZones: [String]?? = nil,
        references: [JSONAny]?? = nil,
        sent: Date?? = nil,
        effective: Date?? = nil,
        onset: Date?? = nil,
        expires: Date?? = nil,
        ends: Date?? = nil,
        status: Status?? = nil,
        messageType: MessageType?? = nil,
        category: Category?? = nil,
        severity: Severity?? = nil,
        certainty: Certainty?? = nil,
        urgency: Urgency?? = nil,
        event: String?? = nil,
        sender: Sender?? = nil,
        senderName: String?? = nil,
        headline: String?? = nil,
        description: String?? = nil,
        instruction: String?? = nil,
        response: Response?? = nil,
        parameters: [String: [String]]?? = nil
    ) -> Properties {
        return Properties(
            id: id ?? self.id,
            type: type ?? self.type,
            propertiesID: propertiesID ?? self.propertiesID,
            areaDesc: areaDesc ?? self.areaDesc,
            geocode: geocode ?? self.geocode,
            affectedZones: affectedZones ?? self.affectedZones,
            references: references ?? self.references,
            sent: sent ?? self.sent,
            effective: effective ?? self.effective,
            onset: onset ?? self.onset,
            expires: expires ?? self.expires,
            ends: ends ?? self.ends,
            status: status ?? self.status,
            messageType: messageType ?? self.messageType,
            category: category ?? self.category,
            severity: severity ?? self.severity,
            certainty: certainty ?? self.certainty,
            urgency: urgency ?? self.urgency,
            event: event ?? self.event,
            sender: sender ?? self.sender,
            senderName: senderName ?? self.senderName,
            headline: headline ?? self.headline,
            description: description ?? self.description,
            instruction: instruction ?? self.instruction,
            response: response ?? self.response,
            parameters: parameters ?? self.parameters
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Category: String, Codable {
    case met = "Met"
}

enum Certainty: String, Codable {
    case likely = "Likely"
    case observed = "Observed"
    case possible = "Possible"
    case unknown = "Unknown"
}

// MARK: - Geocode
struct Geocode: Codable {
    let same, ugc: [String]?

    enum CodingKeys: String, CodingKey {
        case same = "SAME"
        case ugc = "UGC"
    }
}

// MARK: Geocode convenience initializers and mutators

extension Geocode {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Geocode.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        same: [String]?? = nil,
        ugc: [String]?? = nil
    ) -> Geocode {
        return Geocode(
            same: same ?? self.same,
            ugc: ugc ?? self.ugc
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum MessageType: String, Codable {
    case alert = "Alert"
}

enum Response: String, Codable {
    case allClear = "AllClear"
    case avoid = "Avoid"
    case execute = "Execute"
    case monitor = "Monitor"
    case prepare = "Prepare"
    case shelter = "Shelter"
}

enum Sender: String, Codable {
    case wNwsWebmasterNoaaGov = "w-nws.webmaster@noaa.gov"
}

enum Severity: String, Codable {
    case minor = "Minor"
    case moderate = "Moderate"
    case severe = "Severe"
    case unknown = "Unknown"
}

enum Status: String, Codable {
    case actual = "Actual"
}

enum TypeEnum: String, Codable {
    case wxAlert = "wx:Alert"
}

enum Urgency: String, Codable {
    case expected = "Expected"
    case future = "Future"
    case immediate = "Immediate"
    case past = "Past"
    case unknown = "Unknown"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}




//struct WeatherAlertsResponse: Codable {
//    let alerts: [WeatherAlert]?
//}
//
//extension WeatherAlertsResponse {
//    enum CodingKeys: String, CodingKey {
//        case alerts = "features"
//    }
//}
