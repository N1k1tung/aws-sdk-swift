// Code generated by smithy-swift-codegen. DO NOT EDIT!

import AWSClientRuntime
import ClientRuntime

/// This is the Amazon Fraud Detector API Reference. This guide is for developers who need detailed information about Amazon Fraud Detector API actions, data types, and errors. For more information about Amazon Fraud Detector features, see the [Amazon Fraud Detector User Guide](https://docs.aws.amazon.com/frauddetector/latest/ug/). We provide the Query API as well as AWS software development kits (SDK) for Amazon Fraud Detector in Java and Python programming languages. The Amazon Fraud Detector Query API provides HTTPS requests that use the HTTP verb GET or POST and a Query parameter Action. AWS SDK provides libraries, sample code, tutorials, and other resources for software developers who prefer to build applications using language-specific APIs instead of submitting a request over HTTP or HTTPS. These libraries provide basic functions that automatically take care of tasks such as cryptographically signing your requests, retrying requests, and handling error responses, so that it is easier for you to get started. For more information about the AWS SDKs, see [Tools to build on AWS](https://docs.aws.amazon.com/https:/aws.amazon.com/tools/).
public protocol FraudDetectorClientProtocol {
    /// Creates a batch of variables.
    func batchCreateVariable(input: BatchCreateVariableInput) async throws -> BatchCreateVariableOutputResponse
    /// Gets a batch of variables.
    func batchGetVariable(input: BatchGetVariableInput) async throws -> BatchGetVariableOutputResponse
    /// Cancels an in-progress batch import job.
    func cancelBatchImportJob(input: CancelBatchImportJobInput) async throws -> CancelBatchImportJobOutputResponse
    /// Cancels the specified batch prediction job.
    func cancelBatchPredictionJob(input: CancelBatchPredictionJobInput) async throws -> CancelBatchPredictionJobOutputResponse
    /// Creates a batch import job.
    func createBatchImportJob(input: CreateBatchImportJobInput) async throws -> CreateBatchImportJobOutputResponse
    /// Creates a batch prediction job.
    func createBatchPredictionJob(input: CreateBatchPredictionJobInput) async throws -> CreateBatchPredictionJobOutputResponse
    /// Creates a detector version. The detector version starts in a DRAFT status.
    func createDetectorVersion(input: CreateDetectorVersionInput) async throws -> CreateDetectorVersionOutputResponse
    /// Creates a model using the specified model type.
    func createModel(input: CreateModelInput) async throws -> CreateModelOutputResponse
    /// Creates a version of the model using the specified model type and model id.
    func createModelVersion(input: CreateModelVersionInput) async throws -> CreateModelVersionOutputResponse
    /// Creates a rule for use with the specified detector.
    func createRule(input: CreateRuleInput) async throws -> CreateRuleOutputResponse
    /// Creates a variable.
    func createVariable(input: CreateVariableInput) async throws -> CreateVariableOutputResponse
    /// Deletes the specified batch import job ID record. This action does not delete the data that was batch imported.
    func deleteBatchImportJob(input: DeleteBatchImportJobInput) async throws -> DeleteBatchImportJobOutputResponse
    /// Deletes a batch prediction job.
    func deleteBatchPredictionJob(input: DeleteBatchPredictionJobInput) async throws -> DeleteBatchPredictionJobOutputResponse
    /// Deletes the detector. Before deleting a detector, you must first delete all detector versions and rule versions associated with the detector. When you delete a detector, Amazon Fraud Detector permanently deletes the detector and the data is no longer stored in Amazon Fraud Detector.
    func deleteDetector(input: DeleteDetectorInput) async throws -> DeleteDetectorOutputResponse
    /// Deletes the detector version. You cannot delete detector versions that are in ACTIVE status. When you delete a detector version, Amazon Fraud Detector permanently deletes the detector and the data is no longer stored in Amazon Fraud Detector.
    func deleteDetectorVersion(input: DeleteDetectorVersionInput) async throws -> DeleteDetectorVersionOutputResponse
    /// Deletes an entity type. You cannot delete an entity type that is included in an event type. When you delete an entity type, Amazon Fraud Detector permanently deletes that entity type and the data is no longer stored in Amazon Fraud Detector.
    func deleteEntityType(input: DeleteEntityTypeInput) async throws -> DeleteEntityTypeOutputResponse
    /// Deletes the specified event. When you delete an event, Amazon Fraud Detector permanently deletes that event and the event data is no longer stored in Amazon Fraud Detector.
    func deleteEvent(input: DeleteEventInput) async throws -> DeleteEventOutputResponse
    /// Deletes all events of a particular event type.
    func deleteEventsByEventType(input: DeleteEventsByEventTypeInput) async throws -> DeleteEventsByEventTypeOutputResponse
    /// Deletes an event type. You cannot delete an event type that is used in a detector or a model. When you delete an event type, Amazon Fraud Detector permanently deletes that event type and the data is no longer stored in Amazon Fraud Detector.
    func deleteEventType(input: DeleteEventTypeInput) async throws -> DeleteEventTypeOutputResponse
    /// Removes a SageMaker model from Amazon Fraud Detector. You can remove an Amazon SageMaker model if it is not associated with a detector version. Removing a SageMaker model disconnects it from Amazon Fraud Detector, but the model remains available in SageMaker.
    func deleteExternalModel(input: DeleteExternalModelInput) async throws -> DeleteExternalModelOutputResponse
    /// Deletes a label. You cannot delete labels that are included in an event type in Amazon Fraud Detector. You cannot delete a label assigned to an event ID. You must first delete the relevant event ID. When you delete a label, Amazon Fraud Detector permanently deletes that label and the data is no longer stored in Amazon Fraud Detector.
    func deleteLabel(input: DeleteLabelInput) async throws -> DeleteLabelOutputResponse
    /// Deletes a model. You can delete models and model versions in Amazon Fraud Detector, provided that they are not associated with a detector version. When you delete a model, Amazon Fraud Detector permanently deletes that model and the data is no longer stored in Amazon Fraud Detector.
    func deleteModel(input: DeleteModelInput) async throws -> DeleteModelOutputResponse
    /// Deletes a model version. You can delete models and model versions in Amazon Fraud Detector, provided that they are not associated with a detector version. When you delete a model version, Amazon Fraud Detector permanently deletes that model version and the data is no longer stored in Amazon Fraud Detector.
    func deleteModelVersion(input: DeleteModelVersionInput) async throws -> DeleteModelVersionOutputResponse
    /// Deletes an outcome. You cannot delete an outcome that is used in a rule version. When you delete an outcome, Amazon Fraud Detector permanently deletes that outcome and the data is no longer stored in Amazon Fraud Detector.
    func deleteOutcome(input: DeleteOutcomeInput) async throws -> DeleteOutcomeOutputResponse
    /// Deletes the rule. You cannot delete a rule if it is used by an ACTIVE or INACTIVE detector version. When you delete a rule, Amazon Fraud Detector permanently deletes that rule and the data is no longer stored in Amazon Fraud Detector.
    func deleteRule(input: DeleteRuleInput) async throws -> DeleteRuleOutputResponse
    /// Deletes a variable. You can't delete variables that are included in an event type in Amazon Fraud Detector. Amazon Fraud Detector automatically deletes model output variables and SageMaker model output variables when you delete the model. You can't delete these variables manually. When you delete a variable, Amazon Fraud Detector permanently deletes that variable and the data is no longer stored in Amazon Fraud Detector.
    func deleteVariable(input: DeleteVariableInput) async throws -> DeleteVariableOutputResponse
    /// Gets all versions for a specified detector.
    func describeDetector(input: DescribeDetectorInput) async throws -> DescribeDetectorOutputResponse
    /// Gets all of the model versions for the specified model type or for the specified model type and model ID. You can also get details for a single, specified model version.
    func describeModelVersions(input: DescribeModelVersionsInput) async throws -> DescribeModelVersionsOutputResponse
    /// Gets all batch import jobs or a specific job of the specified ID. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 50 records per page. If you provide a maxResults, the value must be between 1 and 50. To get the next page results, provide the pagination token from the GetBatchImportJobsResponse as part of your request. A null pagination token fetches the records from the beginning.
    func getBatchImportJobs(input: GetBatchImportJobsInput) async throws -> GetBatchImportJobsOutputResponse
    /// Gets all batch prediction jobs or a specific job if you specify a job ID. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 50 records per page. If you provide a maxResults, the value must be between 1 and 50. To get the next page results, provide the pagination token from the GetBatchPredictionJobsResponse as part of your request. A null pagination token fetches the records from the beginning.
    func getBatchPredictionJobs(input: GetBatchPredictionJobsInput) async throws -> GetBatchPredictionJobsOutputResponse
    /// Retrieves the status of a DeleteEventsByEventType action.
    func getDeleteEventsByEventTypeStatus(input: GetDeleteEventsByEventTypeStatusInput) async throws -> GetDeleteEventsByEventTypeStatusOutputResponse
    /// Gets all detectors or a single detector if a detectorId is specified. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 10 records per page. If you provide a maxResults, the value must be between 5 and 10. To get the next page results, provide the pagination token from the GetDetectorsResponse as part of your request. A null pagination token fetches the records from the beginning.
    func getDetectors(input: GetDetectorsInput) async throws -> GetDetectorsOutputResponse
    /// Gets a particular detector version.
    func getDetectorVersion(input: GetDetectorVersionInput) async throws -> GetDetectorVersionOutputResponse
    /// Gets all entity types or a specific entity type if a name is specified. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 10 records per page. If you provide a maxResults, the value must be between 5 and 10. To get the next page results, provide the pagination token from the GetEntityTypesResponse as part of your request. A null pagination token fetches the records from the beginning.
    func getEntityTypes(input: GetEntityTypesInput) async throws -> GetEntityTypesOutputResponse
    /// Retrieves details of events stored with Amazon Fraud Detector. This action does not retrieve prediction results.
    func getEvent(input: GetEventInput) async throws -> GetEventOutputResponse
    /// Evaluates an event against a detector version. If a version ID is not provided, the detector’s (ACTIVE) version is used.
    func getEventPrediction(input: GetEventPredictionInput) async throws -> GetEventPredictionOutputResponse
    /// Gets details of the past fraud predictions for the specified event ID, event type, detector ID, and detector version ID that was generated in the specified time period.
    func getEventPredictionMetadata(input: GetEventPredictionMetadataInput) async throws -> GetEventPredictionMetadataOutputResponse
    /// Gets all event types or a specific event type if name is provided. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 10 records per page. If you provide a maxResults, the value must be between 5 and 10. To get the next page results, provide the pagination token from the GetEventTypesResponse as part of your request. A null pagination token fetches the records from the beginning.
    func getEventTypes(input: GetEventTypesInput) async throws -> GetEventTypesOutputResponse
    /// Gets the details for one or more Amazon SageMaker models that have been imported into the service. This is a paginated API. If you provide a null maxResults, this actions retrieves a maximum of 10 records per page. If you provide a maxResults, the value must be between 5 and 10. To get the next page results, provide the pagination token from the GetExternalModelsResult as part of your request. A null pagination token fetches the records from the beginning.
    func getExternalModels(input: GetExternalModelsInput) async throws -> GetExternalModelsOutputResponse
    /// Gets the encryption key if a KMS key has been specified to be used to encrypt content in Amazon Fraud Detector.
    func getKMSEncryptionKey(input: GetKMSEncryptionKeyInput) async throws -> GetKMSEncryptionKeyOutputResponse
    /// Gets all labels or a specific label if name is provided. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 50 records per page. If you provide a maxResults, the value must be between 10 and 50. To get the next page results, provide the pagination token from the GetGetLabelsResponse as part of your request. A null pagination token fetches the records from the beginning.
    func getLabels(input: GetLabelsInput) async throws -> GetLabelsOutputResponse
    /// Gets one or more models. Gets all models for the Amazon Web Services account if no model type and no model id provided. Gets all models for the Amazon Web Services account and model type, if the model type is specified but model id is not provided. Gets a specific model if (model type, model id) tuple is specified. This is a paginated API. If you provide a null maxResults, this action retrieves a maximum of 10 records per page. If you provide a maxResults, the value must be between 1 and 10. To get the next page results, provide the pagination token from the response as part of your request. A null pagination token fetches the records from the beginning.
    func getModels(input: GetModelsInput) async throws -> GetModelsOutputResponse
    /// Gets the details of the specified model version.
    func getModelVersion(input: GetModelVersionInput) async throws -> GetModelVersionOutputResponse
    /// Gets one or more outcomes. This is a paginated API. If you provide a null maxResults, this actions retrieves a maximum of 100 records per page. If you provide a maxResults, the value must be between 50 and 100. To get the next page results, provide the pagination token from the GetOutcomesResult as part of your request. A null pagination token fetches the records from the beginning.
    func getOutcomes(input: GetOutcomesInput) async throws -> GetOutcomesOutputResponse
    /// Get all rules for a detector (paginated) if ruleId and ruleVersion are not specified. Gets all rules for the detector and the ruleId if present (paginated). Gets a specific rule if both the ruleId and the ruleVersion are specified. This is a paginated API. Providing null maxResults results in retrieving maximum of 100 records per page. If you provide maxResults the value must be between 50 and 100. To get the next page result, a provide a pagination token from GetRulesResult as part of your request. Null pagination token fetches the records from the beginning.
    func getRules(input: GetRulesInput) async throws -> GetRulesOutputResponse
    /// Gets all of the variables or the specific variable. This is a paginated API. Providing null maxSizePerPage results in retrieving maximum of 100 records per page. If you provide maxSizePerPage the value must be between 50 and 100. To get the next page result, a provide a pagination token from GetVariablesResult as part of your request. Null pagination token fetches the records from the beginning.
    func getVariables(input: GetVariablesInput) async throws -> GetVariablesOutputResponse
    /// Gets a list of past predictions. The list can be filtered by detector ID, detector version ID, event ID, event type, or by specifying a time period. If filter is not specified, the most recent prediction is returned. For example, the following filter lists all past predictions for xyz event type - { "eventType":{ "value": "xyz" }” }  This is a paginated API. If you provide a null maxResults, this action will retrieve a maximum of 10 records per page. If you provide a maxResults, the value must be between 50 and 100. To get the next page results, provide the nextToken from the response as part of your request. A null nextToken fetches the records from the beginning.
    func listEventPredictions(input: ListEventPredictionsInput) async throws -> ListEventPredictionsOutputResponse
    /// Lists all tags associated with the resource. This is a paginated API. To get the next page results, provide the pagination token from the response as part of your request. A null pagination token fetches the records from the beginning.
    func listTagsForResource(input: ListTagsForResourceInput) async throws -> ListTagsForResourceOutputResponse
    /// Creates or updates a detector.
    func putDetector(input: PutDetectorInput) async throws -> PutDetectorOutputResponse
    /// Creates or updates an entity type. An entity represents who is performing the event. As part of a fraud prediction, you pass the entity ID to indicate the specific entity who performed the event. An entity type classifies the entity. Example classifications include customer, merchant, or account.
    func putEntityType(input: PutEntityTypeInput) async throws -> PutEntityTypeOutputResponse
    /// Creates or updates an event type. An event is a business activity that is evaluated for fraud risk. With Amazon Fraud Detector, you generate fraud predictions for events. An event type defines the structure for an event sent to Amazon Fraud Detector. This includes the variables sent as part of the event, the entity performing the event (such as a customer), and the labels that classify the event. Example event types include online payment transactions, account registrations, and authentications.
    func putEventType(input: PutEventTypeInput) async throws -> PutEventTypeOutputResponse
    /// Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update the configuration of the model endpoint, including the IAM role and/or the mapped variables.
    func putExternalModel(input: PutExternalModelInput) async throws -> PutExternalModelOutputResponse
    /// Specifies the KMS key to be used to encrypt content in Amazon Fraud Detector.
    func putKMSEncryptionKey(input: PutKMSEncryptionKeyInput) async throws -> PutKMSEncryptionKeyOutputResponse
    /// Creates or updates label. A label classifies an event as fraudulent or legitimate. Labels are associated with event types and used to train supervised machine learning models in Amazon Fraud Detector.
    func putLabel(input: PutLabelInput) async throws -> PutLabelOutputResponse
    /// Creates or updates an outcome.
    func putOutcome(input: PutOutcomeInput) async throws -> PutOutcomeOutputResponse
    /// Stores events in Amazon Fraud Detector without generating fraud predictions for those events. For example, you can use SendEvent to upload a historical dataset, which you can then later use to train a model.
    func sendEvent(input: SendEventInput) async throws -> SendEventOutputResponse
    /// Assigns tags to a resource.
    func tagResource(input: TagResourceInput) async throws -> TagResourceOutputResponse
    /// Removes tags from a resource.
    func untagResource(input: UntagResourceInput) async throws -> UntagResourceOutputResponse
    /// Updates a detector version. The detector version attributes that you can update include models, external model endpoints, rules, rule execution mode, and description. You can only update a DRAFT detector version.
    func updateDetectorVersion(input: UpdateDetectorVersionInput) async throws -> UpdateDetectorVersionOutputResponse
    /// Updates the detector version's description. You can update the metadata for any detector version (DRAFT, ACTIVE, or INACTIVE).
    func updateDetectorVersionMetadata(input: UpdateDetectorVersionMetadataInput) async throws -> UpdateDetectorVersionMetadataOutputResponse
    /// Updates the detector version’s status. You can perform the following promotions or demotions using UpdateDetectorVersionStatus: DRAFT to ACTIVE, ACTIVE to INACTIVE, and INACTIVE to ACTIVE.
    func updateDetectorVersionStatus(input: UpdateDetectorVersionStatusInput) async throws -> UpdateDetectorVersionStatusOutputResponse
    /// Updates the specified event with a new label.
    func updateEventLabel(input: UpdateEventLabelInput) async throws -> UpdateEventLabelOutputResponse
    /// Updates model description.
    func updateModel(input: UpdateModelInput) async throws -> UpdateModelOutputResponse
    /// Updates a model version. Updating a model version retrains an existing model version using updated training data and produces a new minor version of the model. You can update the training data set location and data access role attributes using this action. This action creates and trains a new minor version of the model, for example version 1.01, 1.02, 1.03.
    func updateModelVersion(input: UpdateModelVersionInput) async throws -> UpdateModelVersionOutputResponse
    /// Updates the status of a model version. You can perform the following status updates:
    ///
    /// * Change the TRAINING_IN_PROGRESS status to TRAINING_CANCELLED.
    ///
    /// * Change the TRAINING_COMPLETE status to ACTIVE.
    ///
    /// * Change ACTIVE to INACTIVE.
    func updateModelVersionStatus(input: UpdateModelVersionStatusInput) async throws -> UpdateModelVersionStatusOutputResponse
    /// Updates a rule's metadata. The description attribute can be updated.
    func updateRuleMetadata(input: UpdateRuleMetadataInput) async throws -> UpdateRuleMetadataOutputResponse
    /// Updates a rule version resulting in a new rule version. Updates a rule version resulting in a new rule version (version 1, 2, 3 ...).
    func updateRuleVersion(input: UpdateRuleVersionInput) async throws -> UpdateRuleVersionOutputResponse
    /// Updates a variable.
    func updateVariable(input: UpdateVariableInput) async throws -> UpdateVariableOutputResponse
}

public protocol FraudDetectorClientConfigurationProtocol : AWSClientRuntime.AWSClientConfiguration {
    var endpointResolver: EndpointResolver { get }
}

public enum FraudDetectorClientTypes {}
