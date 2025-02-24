// Code generated by smithy-swift-codegen. DO NOT EDIT!

import AWSClientRuntime
import ClientRuntime
import Foundation
import Logging

public class SSOClient {
    public static let clientName = "SSOClient"
    let client: ClientRuntime.SdkHttpClient
    let config: SSOClientConfigurationProtocol
    let serviceName = "SSO"
    let encoder: ClientRuntime.RequestEncoder
    let decoder: ClientRuntime.ResponseDecoder

    public init(config: SSOClientConfigurationProtocol) {
        client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
        let encoder = ClientRuntime.JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
        self.encoder = config.encoder ?? encoder
        let decoder = ClientRuntime.JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
        self.decoder = config.decoder ?? decoder
        self.config = config
    }

    public convenience init(region: Swift.String) throws {
        let config = try SSOClientConfiguration(region: region)
        self.init(config: config)
    }

    public convenience init() async throws {
        let config = try await SSOClientConfiguration()
        self.init(config: config)
    }

    public class SSOClientConfiguration: SSOClientConfigurationProtocol {
        public var clientLogMode: ClientRuntime.ClientLogMode
        public var decoder: ClientRuntime.ResponseDecoder?
        public var encoder: ClientRuntime.RequestEncoder?
        public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
        public var httpClientEngine: ClientRuntime.HttpClientEngine
        public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
        public var logger: ClientRuntime.LogAgent
        public var retryer: ClientRuntime.SDKRetryer

        public var credentialsProvider: AWSClientRuntime.CredentialsProvider
        public var endpoint: Swift.String?
        public var frameworkMetadata: AWSClientRuntime.FrameworkMetadata?
        public var region: Swift.String?
        public var regionResolver: AWSClientRuntime.RegionResolver?
        public var signingRegion: Swift.String?
        public var useDualStack: Swift.Bool?
        public var useFIPS: Swift.Bool?

        public var endpointResolver: EndpointResolver

        public init(
            credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
            endpoint: Swift.String? = nil,
            endpointResolver: EndpointResolver? = nil,
            frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
            region: Swift.String,
            regionResolver: AWSClientRuntime.RegionResolver? = nil,
            runtimeConfig: ClientRuntime.SDKRuntimeConfiguration,
            signingRegion: Swift.String? = nil,
            useDualStack: Swift.Bool? = nil,
            useFIPS: Swift.Bool? = nil
        ) throws {
            if let credProvider = credentialsProvider {
                self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromCustom(credProvider)
            } else {
                self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromChain()
            }
            self.endpoint = endpoint
            if let endpointResolver = endpointResolver {
                self.endpointResolver = endpointResolver
            } else {
                self.endpointResolver = try DefaultEndpointResolver()
            }
            self.frameworkMetadata = frameworkMetadata
            self.region = region
            self.regionResolver = try regionResolver ?? DefaultRegionResolver()
            self.signingRegion = signingRegion ?? region
            self.useDualStack = useDualStack
            self.useFIPS = useFIPS
            self.clientLogMode = runtimeConfig.clientLogMode
            self.decoder = runtimeConfig.decoder
            self.encoder = runtimeConfig.encoder
            self.httpClientConfiguration = runtimeConfig.httpClientConfiguration
            self.httpClientEngine = runtimeConfig.httpClientEngine
            self.idempotencyTokenGenerator = runtimeConfig.idempotencyTokenGenerator
            self.logger = runtimeConfig.logger
            self.retryer = runtimeConfig.retryer
        }

        public convenience init(
            credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
            endpoint: Swift.String? = nil,
            endpointResolver: EndpointResolver? = nil,
            frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
            region: Swift.String,
            regionResolver: AWSClientRuntime.RegionResolver? = nil,
            signingRegion: Swift.String? = nil,
            useDualStack: Swift.Bool? = nil,
            useFIPS: Swift.Bool? = nil
        ) throws {
            let runtimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("SSOClient")
            try self.init(
                credentialsProvider: credentialsProvider,
                endpoint: endpoint,
                endpointResolver: endpointResolver,
                frameworkMetadata: frameworkMetadata,
                region: region,
                regionResolver: regionResolver,
                runtimeConfig: runtimeConfig,
                signingRegion: signingRegion,
                useDualStack: useDualStack,
                useFIPS: useFIPS
            )
        }

        public init(
            credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
            endpoint: Swift.String? = nil,
            endpointResolver: EndpointResolver? = nil,
            frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
            regionResolver: AWSClientRuntime.RegionResolver? = nil,
            runtimeConfig: ClientRuntime.SDKRuntimeConfiguration,
            signingRegion: Swift.String? = nil,
            useDualStack: Swift.Bool? = nil,
            useFIPS: Swift.Bool? = nil
        ) async throws {
            if let credProvider = credentialsProvider {
                self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromCustom(credProvider)
            } else {
                self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromChain()
            }
            self.endpoint = endpoint
            if let endpointResolver = endpointResolver {
                self.endpointResolver = endpointResolver
            } else {
                self.endpointResolver = try DefaultEndpointResolver()
            }
            self.frameworkMetadata = frameworkMetadata
            let resolvedRegionResolver = try regionResolver ?? DefaultRegionResolver()
            self.region = await resolvedRegionResolver.resolveRegion()
            self.regionResolver = try regionResolver ?? DefaultRegionResolver()
            self.signingRegion = signingRegion ?? region
            self.useDualStack = useDualStack
            self.useFIPS = useFIPS
            self.clientLogMode = runtimeConfig.clientLogMode
            self.decoder = runtimeConfig.decoder
            self.encoder = runtimeConfig.encoder
            self.httpClientConfiguration = runtimeConfig.httpClientConfiguration
            self.httpClientEngine = runtimeConfig.httpClientEngine
            self.idempotencyTokenGenerator = runtimeConfig.idempotencyTokenGenerator
            self.logger = runtimeConfig.logger
            self.retryer = runtimeConfig.retryer
        }

        public convenience init(
            credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
            endpoint: Swift.String? = nil,
            endpointResolver: EndpointResolver? = nil,
            frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
            regionResolver: AWSClientRuntime.RegionResolver? = nil,
            signingRegion: Swift.String? = nil,
            useDualStack: Swift.Bool? = nil,
            useFIPS: Swift.Bool? = nil
        ) async throws {
            let runtimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("SSOClient")
            try await self.init(
                credentialsProvider: credentialsProvider,
                endpoint: endpoint,
                endpointResolver: endpointResolver,
                frameworkMetadata: frameworkMetadata,
                regionResolver: regionResolver,
                runtimeConfig: runtimeConfig,
                signingRegion: signingRegion,
                useDualStack: useDualStack,
                useFIPS: useFIPS
            )
        }

        public var partitionID: String? {
            return "SSOClient - \(region ?? "")"
        }
    }
}

public struct SSOClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory {
    public var label = "SSOClient"
    let logLevel: ClientRuntime.SDKLogLevel
    public func construct(label: String) -> LogHandler {
        var handler = StreamLogHandler.standardOutput(label: label)
        handler.logLevel = logLevel.toLoggerType()
        return handler
    }
    public init(logLevel: ClientRuntime.SDKLogLevel) {
        self.logLevel = logLevel
    }
}

extension SSOClient: SSOClientProtocol {
    /// Returns the STS short-term credentials for a given role name that is assigned to the user.
    public func getRoleCredentials(input: GetRoleCredentialsInput) async throws -> GetRoleCredentialsOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .get)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "getRoleCredentials")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
        var operation = ClientRuntime.OperationStack<GetRoleCredentialsInput, GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>(id: "getRoleCredentials")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<GetRoleCredentialsInput, GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<GetRoleCredentialsInput, GetRoleCredentialsOutputResponse>())
        guard let region = config.region else {
            throw SdkError<GetRoleCredentialsOutputError>.client(ClientError.unknownError(("Missing required parameter: Region")))
        }
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.HeaderMiddleware<GetRoleCredentialsInput, GetRoleCredentialsOutputResponse>())
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.QueryItemMiddleware<GetRoleCredentialsInput, GetRoleCredentialsOutputResponse>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>(retryer: config.retryer))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }

    /// Lists all roles that are assigned to the user for a given AWS account.
    public func listAccountRoles(input: ListAccountRolesInput) async throws -> ListAccountRolesOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .get)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "listAccountRoles")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
        var operation = ClientRuntime.OperationStack<ListAccountRolesInput, ListAccountRolesOutputResponse, ListAccountRolesOutputError>(id: "listAccountRoles")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<ListAccountRolesInput, ListAccountRolesOutputResponse, ListAccountRolesOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<ListAccountRolesInput, ListAccountRolesOutputResponse>())
        guard let region = config.region else {
            throw SdkError<ListAccountRolesOutputError>.client(ClientError.unknownError(("Missing required parameter: Region")))
        }
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<ListAccountRolesOutputResponse, ListAccountRolesOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.HeaderMiddleware<ListAccountRolesInput, ListAccountRolesOutputResponse>())
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.QueryItemMiddleware<ListAccountRolesInput, ListAccountRolesOutputResponse>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<ListAccountRolesOutputResponse, ListAccountRolesOutputError>(retryer: config.retryer))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<ListAccountRolesOutputResponse, ListAccountRolesOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<ListAccountRolesOutputResponse, ListAccountRolesOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }

    /// Lists all AWS accounts assigned to the user. These AWS accounts are assigned by the administrator of the account. For more information, see [Assign User Access](https://docs.aws.amazon.com/singlesignon/latest/userguide/useraccess.html#assignusers) in the IAM Identity Center User Guide. This operation returns a paginated response.
    public func listAccounts(input: ListAccountsInput) async throws -> ListAccountsOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .get)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "listAccounts")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
        var operation = ClientRuntime.OperationStack<ListAccountsInput, ListAccountsOutputResponse, ListAccountsOutputError>(id: "listAccounts")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<ListAccountsInput, ListAccountsOutputResponse, ListAccountsOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<ListAccountsInput, ListAccountsOutputResponse>())
        guard let region = config.region else {
            throw SdkError<ListAccountsOutputError>.client(ClientError.unknownError(("Missing required parameter: Region")))
        }
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<ListAccountsOutputResponse, ListAccountsOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.HeaderMiddleware<ListAccountsInput, ListAccountsOutputResponse>())
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.QueryItemMiddleware<ListAccountsInput, ListAccountsOutputResponse>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<ListAccountsOutputResponse, ListAccountsOutputError>(retryer: config.retryer))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<ListAccountsOutputResponse, ListAccountsOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<ListAccountsOutputResponse, ListAccountsOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }

    /// Removes the locally stored SSO tokens from the client-side cache and sends an API call to the IAM Identity Center service to invalidate the corresponding server-side IAM Identity Center sign in session. If a user uses IAM Identity Center to access the AWS CLI, the user’s IAM Identity Center sign in session is used to obtain an IAM session, as specified in the corresponding IAM Identity Center permission set. More specifically, IAM Identity Center assumes an IAM role in the target account on behalf of the user, and the corresponding temporary AWS credentials are returned to the client. After user logout, any existing IAM role sessions that were created by using IAM Identity Center permission sets continue based on the duration configured in the permission set. For more information, see [User authentications](https://docs.aws.amazon.com/singlesignon/latest/userguide/authconcept.html) in the IAM Identity Center User Guide.
    public func logout(input: LogoutInput) async throws -> LogoutOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "logout")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
        var operation = ClientRuntime.OperationStack<LogoutInput, LogoutOutputResponse, LogoutOutputError>(id: "logout")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<LogoutInput, LogoutOutputResponse, LogoutOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<LogoutInput, LogoutOutputResponse>())
        guard let region = config.region else {
            throw SdkError<LogoutOutputError>.client(ClientError.unknownError(("Missing required parameter: Region")))
        }
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<LogoutOutputResponse, LogoutOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.HeaderMiddleware<LogoutInput, LogoutOutputResponse>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<LogoutOutputResponse, LogoutOutputError>(retryer: config.retryer))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<LogoutOutputResponse, LogoutOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<LogoutOutputResponse, LogoutOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }

}
