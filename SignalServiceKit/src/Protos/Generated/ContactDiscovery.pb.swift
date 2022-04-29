//
//  Copyright (c) 2022 Open Whisper Systems. All rights reserved.
//

///*
/// Copyright (C) 2019 Open Whisper Systems
///
/// Licensed according to the LICENSE file in this repository.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct ContactDiscoveryMessages_ClientRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Each ACI/UAK pair is a 32-byte buffer, containing the 16-byte ACI followed
  /// by its 16-byte UAK.
  var aciUakPairs: Data = Data()

  /// Each E164 is an 8-byte big-endian number, as 8 bytes.
  var prevE164List: Data = Data()

  var newE164List: Data = Data()

  var discardE164List: Data = Data()

  /// If true, the client has more pairs or e164s to send.  If false or unset,
  /// this is the client's last request, and processing should commence.
  var moreComing: Bool = false

  /// If set, a token which allows rate limiting to discount the e164s in
  /// the request's prev_e164s, only counting new_e164s.  If not set, then
  /// rate limiting considers both prev_e164s' and new_e164s' size.
  var token: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ContactDiscoveryMessages_ClientResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Each triple is an 8-byte e164, a 16-byte PNI, and a 16-byte ACI.
  /// If the e164 was not found, PNI and ACI are all zeros.  If the PNI
  /// was found but the ACI was not, the PNI will be non-zero and the ACI
  /// will be all zeros.  ACI will be returned if one of the returned
  /// PNIs has an ACI/UAK pair that matches.
  ///
  /// Should the request be successful (IE: a successful status returned),
  /// |e164_pni_aci_triple| will always equal |e164| of the request,
  /// so the entire marshalled size of the response will be (2+32)*|e164|,
  /// where the additional 2 bytes are the id/type/length additions of the
  /// protobuf marshaling added to each byte array.  This avoids any data
  /// leakage based on the size of the encrypted output.
  var e164PniAciTriples: Data = Data()

  /// If the user has run out of quota for lookups, they will receive
  /// a response with just the following field set, followed by a websocket
  /// closure of type 4008 (RESOURCE_EXHAUSTED).  Should they retry exactly
  /// the same request after the provided number of seconds has passed,
  /// we expect it should work.
  var retryAfterSecs: Int32 = 0

  /// A token which allows subsequent calls' rate limiting to discount the
  /// e164s sent up in this request, only counting those in the next
  /// request's new_e164s.
  var token: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension ContactDiscoveryMessages_ClientRequest: @unchecked Sendable {}
extension ContactDiscoveryMessages_ClientResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "ContactDiscoveryMessages"

extension ContactDiscoveryMessages_ClientRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ClientRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "aciUakPairs"),
    2: .same(proto: "prevE164List"),
    3: .same(proto: "newE164List"),
    4: .same(proto: "discardE164List"),
    5: .same(proto: "moreComing"),
    6: .same(proto: "token"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.aciUakPairs) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.prevE164List) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.newE164List) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.discardE164List) }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.moreComing) }()
      case 6: try { try decoder.decodeSingularBytesField(value: &self.token) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.aciUakPairs.isEmpty {
      try visitor.visitSingularBytesField(value: self.aciUakPairs, fieldNumber: 1)
    }
    if !self.prevE164List.isEmpty {
      try visitor.visitSingularBytesField(value: self.prevE164List, fieldNumber: 2)
    }
    if !self.newE164List.isEmpty {
      try visitor.visitSingularBytesField(value: self.newE164List, fieldNumber: 3)
    }
    if !self.discardE164List.isEmpty {
      try visitor.visitSingularBytesField(value: self.discardE164List, fieldNumber: 4)
    }
    if self.moreComing != false {
      try visitor.visitSingularBoolField(value: self.moreComing, fieldNumber: 5)
    }
    if !self.token.isEmpty {
      try visitor.visitSingularBytesField(value: self.token, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ContactDiscoveryMessages_ClientRequest, rhs: ContactDiscoveryMessages_ClientRequest) -> Bool {
    if lhs.aciUakPairs != rhs.aciUakPairs {return false}
    if lhs.prevE164List != rhs.prevE164List {return false}
    if lhs.newE164List != rhs.newE164List {return false}
    if lhs.discardE164List != rhs.discardE164List {return false}
    if lhs.moreComing != rhs.moreComing {return false}
    if lhs.token != rhs.token {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ContactDiscoveryMessages_ClientResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ClientResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "e164PniAciTriples"),
    2: .same(proto: "retryAfterSecs"),
    3: .same(proto: "token"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.e164PniAciTriples) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.retryAfterSecs) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.token) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.e164PniAciTriples.isEmpty {
      try visitor.visitSingularBytesField(value: self.e164PniAciTriples, fieldNumber: 1)
    }
    if self.retryAfterSecs != 0 {
      try visitor.visitSingularInt32Field(value: self.retryAfterSecs, fieldNumber: 2)
    }
    if !self.token.isEmpty {
      try visitor.visitSingularBytesField(value: self.token, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ContactDiscoveryMessages_ClientResponse, rhs: ContactDiscoveryMessages_ClientResponse) -> Bool {
    if lhs.e164PniAciTriples != rhs.e164PniAciTriples {return false}
    if lhs.retryAfterSecs != rhs.retryAfterSecs {return false}
    if lhs.token != rhs.token {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
