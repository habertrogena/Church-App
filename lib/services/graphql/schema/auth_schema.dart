class LoginSchema {
  getMe() {
    return """
      query getMe {
        getMe{
          id
          name
          imageUrl
          user_type
          status
        }
      }
    """;
  }

  getTenant() {
    return """
      query getTenantProfile{
        getTenantUser {
          name
          uid
        }
    }
    """;
  }
}
