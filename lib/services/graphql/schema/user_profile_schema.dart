class UserSchema {
  getProfile() {
    return """
      query getTenantProfile{
        getTenantUser {
          name
          uid
          name
          contact
          phone
          quarterly
          roomNo
          size
          deposit
          amount
        }
      }
    """;
  }

  updateTenant() {
    return """
      mutation updateTenant(\$uid: String!, \$updateClient: UpdateClientInput!) {
          updateClient(clientUid: \$uid, updateClient: \$updateClient) {
            uid
          }
      }
    """;
  }
}
