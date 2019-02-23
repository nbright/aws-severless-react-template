import gql from 'graphql-tag';
import Organization from './Organization';

const User = {
  fragments: {
    global: gql`
      fragment UserEntry on User {
        __typename
        id
        name
        title
        phone
        email
        active
        createdAt
        updatedAt
        organizationId
        organization {
          __typename
          ...OrganizationEntry
        }
        assignedRoles {
          items {
            id
            role {
              id
              name
            }
          }
        }
      }
      ${Organization.fragments.global}
    `
  }
}

export default User;