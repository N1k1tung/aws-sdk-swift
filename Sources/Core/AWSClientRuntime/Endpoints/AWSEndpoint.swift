//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

/**
  A structure used by the service client to determine the endpoint.
  The SDK will automatically resolve endpoints per API client using an internal resolver.
 */
public struct AWSEndpoint: Equatable {
    /**
    The endpoint object contains the host name (e.g. "{service-id}.{region}.amazonaws.com"),
    the transport protocol (e.g. "HTTPS") and the port to connect to when making requests to this endpoint.
     */
    public let endpoint: Endpoint

    /**
    Flag indicating that the hostname can be modified by the SDK client.
    If the hostname is mutable the SDK clients may modify any part of the hostname based
    on the requirements of the API (e.g. adding or removing content in the hostname). If the hostname
    is expected to be mutable and the client cannot modify the endpoint correctly, the operation
    will likely fail.
    */
    public let isHostnameImmutable: Bool
    /**
     The service name that should be used for signing requests to this endpoint.
     This overrides the default signing name used by an SDK client.
     */
    public let signingName: String?
    /**
    The region that should be used for signing requests to this endpoint.
    This overrides the default signing region used by an SDK client.
     */
    public let signingRegion: String?

    public init(endpoint: Endpoint,
                isHostnameImmutable: Bool = false,
                signingName: String? = nil,
                signingRegion: String? = nil) {
        self.endpoint = endpoint
        self.isHostnameImmutable = isHostnameImmutable
        self.signingName = signingName
        self.signingRegion = signingRegion
    }

    public static func resolveEndpoint(partitions: [Partition], region: String) throws -> AWSEndpoint {
        guard !partitions.isEmpty else {
            throw EndpointError.partitionsEmpty(
                "The partitions array cannot be empty in order to properly resolve an AWS endpoint")
        }

        let candidate = partitions.first { $0.canResolveEndpoint(region: region)} ?? partitions[0]
        return try candidate.resolveEndpoint(region: region)
    }
}

/// Keys used to access auth scheme container and auth scheme properties
private enum AuthSchemeKeys {
    static let authSchemes = "authSchemes"
    static let signingRegion = "signingRegion"
    static let signingRegionSet = "signingRegionSet"
    static let signingName = "signingName"
    static let name = "name"
}

extension Endpoint {

    /// Returns the auth scheme for the given name
    /// This is an internal API and subject to change without notice
    /// - Parameter name: Name of the auth scheme
    /// - Returns: auth scheme for given auth scheme name if present
    public func authScheme(name: String) -> [String: Any]? {
        guard let scheme = authSchemes()?.first(where: {
            guard let schemeName = $0[AuthSchemeKeys.name] as? String else {
                return false
            }
            return name == schemeName }) else {
            return nil
        }

        return scheme
    }

    /// Returns list of auth schemes
    /// This is an internal API and subject to change without notice
    /// - Returns: list of auth schemes if present
    public func authSchemes() -> [[String: Any]]? {
        guard let schemes = properties[AuthSchemeKeys.authSchemes] as? [[String: Any]] else {
            return nil
        }

        return schemes
    }

    /// Returns signing region from the auth scheme
    /// This is an internal API and subject to change without notice
    /// - Parameter authScheme: authScheme to get signing region from
    /// - Returns: signing region if present, eg. "us-east-1" or "*"
    public static func signingRegion(from authScheme: [String: Any]?) -> String? {
        if let region = authScheme?[AuthSchemeKeys.signingRegion] as? String {
            return region
        }

        if let regionSet = authScheme?[AuthSchemeKeys.signingRegionSet] as? [String] {
            return regionSet.first
        }

        return nil
    }

    /// Returns signing name from the auth scheme
    /// This is an internal API and subject to change without notice
    /// - Parameter authScheme: authScheme to get signing name from
    /// - Returns: signing name if present, eg. "s3"
    public static func signingName(from authScheme: [String: Any]?) -> String? {
        return authScheme?[AuthSchemeKeys.signingName] as? String
    }

    /// Returns name of the auth scheme which used to determine which signing algorithm to use to sign http request
    /// This is an internal API and subject to change without notice
    /// - Parameter authScheme: authScheme to get name from
    /// - Returns: name of the auth scheme if present, eg. sigv4, sigv4a
    public static func signingAlgorithm(from authScheme: [String: Any]?) -> String? {
        return authScheme?[AuthSchemeKeys.name] as? String
    }
 }
