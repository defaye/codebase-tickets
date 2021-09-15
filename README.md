# README

Very basic (and incomplete) API for quickly making tickets for CodebaseHQ. 

:warning: There is already an "Add Multiple Tickets" feature that can handle CSV uploads.

That said, if you want to dynamically set certain content (e.g. in the description), this is not a bad (quick and dirty) solution.

You could make your tickets in YAML e.g.

```
-
  summary: My ticket1          
  tags: Tag1 Tag2
  estimated_time: 120
  description: My description
-
  summary: My ticket2
  tags: Tag1 Tag2
  estimated_time: 180
  description: My description

```

Get your API username and password (and enable API access) from your [profile](https://codebasehq.com/settings/profile).

#### Example usage

Run `bin/rails console`.

Require the Ticket class, set you and your project details and the path to your ticket YAML data and import:

```
username: 'my_username'
password: 'my_password'
project = 'my_project'
ticket_path = 'tmp/my_tickets.yml'

tickets = YAML.safe_load(File.open(Rails.root.join(ticket_path), 'r'))

require "codebase_hq/api/ticket"

ticket_api = CodebaseHq::Api::Ticket.new(username: username, password: password)
tickets.each { |ticket| ticket_api.create(project: project, ticket: ticket) }
```

