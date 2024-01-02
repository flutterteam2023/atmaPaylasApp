class ActiveRequests {
  final Set<String> _activeEndpoints = {};

  void addActiveRequest(String endpoint) {
    _activeEndpoints.add(endpoint);
  }

  void removeActiveRequest(String endpoint) {
    _activeEndpoints.remove(endpoint);
  }

  bool hasActiveRequest(String endpoint) {
    return _activeEndpoints.contains(endpoint);
  }
}
