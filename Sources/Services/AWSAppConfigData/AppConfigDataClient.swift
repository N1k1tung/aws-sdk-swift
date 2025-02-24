// Code generated by smithy-swift-codegen. DO NOT EDIT!

import AWSClientRuntime
import ClientRuntime
import Foundation
import Logging

public class AppConfigDataClient {
    public static let clientName = "AppConfigDataClient"
    let client: ClientRuntime.SdkHttpClient
    let config: AppConfigDataClientConfigurationProtocol
    let serviceName = "AppConfigData"
    let encoder: ClientRuntime.RequestEncoder
    let decoder: ClientRuntime.ResponseDecoder

    public init(config: AppConfigDataClientConfigurationProtocol) {
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
        let config = try AppConfigDataClientConfiguration(region: region)
        self.init(config: config)
    }

    public convenience init() async throws {
        let config = try await AppConfigDataClientConfiguration()
        self.init(config: config)
    }

    public class AppConfigDataClientConfiguration: AppConfigDataClientConfigurationProtocol {
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
            let runtimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("AppConfigDataClient")
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
            let runtimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("AppConfigDataClient")
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
            return "AppConfigDataClient - \(region ?? "")"
        }
    }
}

public struct AppConfigDataClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory {
    public var label = "AppConfigDataClient"
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

extension AppConfigDataClient: AppConfigDataClientProtocol {
    /// Retrieves the latest deployed configuration. This API may return empty configuration data if the client already has the latest version. For more information about this API action and to view example CLI commands that show how to use it with the [StartConfigurationSession] API action, see [Receiving the configuration](http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-the-configuration) in the AppConfig User Guide. Note the following important information.
    ///
    /// * Each configuration token is only valid for one call to GetLatestConfiguration. The GetLatestConfiguration response includes a NextPollConfigurationToken that should always replace the token used for the just-completed call in preparation for the next one.
    ///
    /// * GetLatestConfiguration is a priced call. For more information, see [Pricing](https://aws.amazon.com/systems-manager/pricing/).
    public func getLatestConfiguration(input: GetLatestConfigurationInput) async throws -> GetLatestConfigurationOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .get)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "getLatestConfiguration")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
                      .withSigningName(value: "appconfig")
                      .withSigningRegion(value: config.signingRegion)
        var operation = ClientRuntime.OperationStack<GetLatestConfigurationInput, GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>(id: "getLatestConfiguration")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<GetLatestConfigurationInput, GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<GetLatestConfigurationInput, GetLatestConfigurationOutputResponse>())
        guard let region = config.region else {
            throw SdkError<GetLatestConfigurationOutputError>.client(ClientError.unknownError(("Missing required parameter: Region")))
        }
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.QueryItemMiddleware<GetLatestConfigurationInput, GetLatestConfigurationOutputResponse>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>(retryer: config.retryer))
        let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>(config: sigv4Config))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<GetLatestConfigurationOutputResponse, GetLatestConfigurationOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }

    /// Starts a configuration session used to retrieve a deployed configuration. For more information about this API action and to view example CLI commands that show how to use it with the [GetLatestConfiguration] API action, see [Receiving the configuration](http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-the-configuration) in the AppConfig User Guide.
    public func startConfigurationSession(input: StartConfigurationSessionInput) async throws -> StartConfigurationSessionOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "startConfigurationSession")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
                      .withSigningName(value: "appconfig")
                      .withSigningRegion(value: config.signingRegion)
        var operation = ClientRuntime.OperationStack<StartConfigurationSessionInput, StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>(id: "startConfigurationSession")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<StartConfigurationSessionInput, StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<StartConfigurationSessionInput, StartConfigurationSessionOutputResponse>())
        guard let region = config.region else {
            throw SdkError<StartConfigurationSessionOutputError>.client(ClientError.unknownError(("Missing required parameter: Region")))
        }
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<StartConfigurationSessionInput, StartConfigurationSessionOutputResponse>(contentType: "application/json"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<StartConfigurationSessionInput, StartConfigurationSessionOutputResponse>(xmlName: "StartConfigurationSessionRequest"))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>(retryer: config.retryer))
        let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>(config: sigv4Config))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<StartConfigurationSessionOutputResponse, StartConfigurationSessionOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }

}
