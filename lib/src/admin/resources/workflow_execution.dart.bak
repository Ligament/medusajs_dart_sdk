import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin workflow execution management resource
class AdminWorkflowExecutionResource extends AdminResource {
  const AdminWorkflowExecutionResource(super.client);

  String get resourcePath => '$basePath/workflow-executions';

  /// List workflow executions
  Future<PaginatedResponse<WorkflowExecution>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<WorkflowExecution>(
      endpoint: resourcePath,
      dataKey: 'workflow_executions',
      fromJson: WorkflowExecution.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a workflow execution by ID
  Future<WorkflowExecution?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<WorkflowExecution>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'workflow_execution',
      fromJson: WorkflowExecution.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new workflow execution
  Future<WorkflowExecution?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<WorkflowExecution>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'workflow_execution',
      fromJson: WorkflowExecution.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a workflow execution
  Future<WorkflowExecution?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<WorkflowExecution>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'workflow_execution',
      fromJson: WorkflowExecution.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a workflow execution
  Future<Map<String, dynamic>> delete(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await deleteGeneric(
      id: id,
      endpoint: '$resourcePath/$id',
      headers: headers,
    );
  }

  /// Execute a workflow
  Future<WorkflowExecution?> execute(
    String workflowId,
    Map<String, dynamic> input, {
    Map<String, dynamic>? options,
    ClientHeaders? headers,
  }) async {
    final body = {
      'workflow_id': workflowId,
      'input': input,
      if (options != null) ...options,
    };

    final response = await client.fetch<Map<String, dynamic>>(
      '$basePath/workflows/run',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final data = response['workflow_execution'];
    return data != null ? WorkflowExecution.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Get workflow execution steps
  Future<PaginatedResponse<Map<String, dynamic>>> getSteps(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/steps',
      query: query,
      headers: headers,
    );

    final items = (response['steps'] as List? ?? [])
        .map((json) => json as Map<String, dynamic>)
        .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Get workflow execution by status
  Future<PaginatedResponse<WorkflowExecution>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }

  /// Get workflow executions by workflow ID
  Future<PaginatedResponse<WorkflowExecution>> byWorkflow(
    String workflowId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['workflow_id'] = workflowId;

    return list(query: query, headers: headers);
  }

  /// Cancel a workflow execution
  Future<WorkflowExecution?> cancel(
    String id, {
    String? reason,
    ClientHeaders? headers,
  }) async {
    final body = {
      if (reason != null) 'reason': reason,
    };

    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/cancel',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final data = response['workflow_execution'];
    return data != null ? WorkflowExecution.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Resume a paused workflow execution
  Future<WorkflowExecution?> resume(
    String id, {
    Map<String, dynamic>? input,
    ClientHeaders? headers,
  }) async {
    final body = {
      if (input != null) 'input': input,
    };

    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/resume',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final data = response['workflow_execution'];
    return data != null ? WorkflowExecution.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Retry a failed workflow execution
  Future<WorkflowExecution?> retry(
    String id, {
    Map<String, dynamic>? input,
    ClientHeaders? headers,
  }) async {
    final body = {
      if (input != null) 'input': input,
    };

    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/retry',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final data = response['workflow_execution'];
    return data != null ? WorkflowExecution.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Get workflow execution logs
  Future<PaginatedResponse<Map<String, dynamic>>> getLogs(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/logs',
      query: query,
      headers: headers,
    );

    final items = (response['logs'] as List? ?? [])
        .map((json) => json as Map<String, dynamic>)
        .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Subscribe to workflow execution events
  Future<Map<String, dynamic>> subscribe(
    String id, {
    List<String>? events,
    String? callbackUrl,
    ClientHeaders? headers,
  }) async {
    final body = {
      if (events != null) 'events': events,
      if (callbackUrl != null) 'callback_url': callbackUrl,
    };

    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/subscribe',
      method: 'POST',
      body: body,
      headers: headers,
    );
  }

  /// Unsubscribe from workflow execution events
  Future<Map<String, dynamic>> unsubscribe(
    String id, {
    String? subscriptionId,
    ClientHeaders? headers,
  }) async {
    final body = {
      if (subscriptionId != null) 'subscription_id': subscriptionId,
    };

    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/unsubscribe',
      method: 'POST',
      body: body,
      headers: headers,
    );
  }
}