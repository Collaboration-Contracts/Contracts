Travis:
[![Build Status](https://travis-ci.org/Collaboration-Contracts/Contracts.svg?branch=master)](https://travis-ci.org/Collaboration-Contracts/Contracts)


Coveralls: [![Coverage Status](https://coveralls.io/repos/github/Collaboration-Contracts/Contracts/badge.svg)](https://coveralls.io/github/Collaboration-Contracts/Contracts)

# Collaboration Contracts

Staging: https://stage-collaboration-contracts.herokuapp.com/

Production: https://www.colllaborationcontracts.com/

Review apps are also created with each pull request. These expire after 5 days of inactivity.

## Getting Started with this Project

### Some necessary system reqs
1. Make sure you have [Ruby installed](https://www.ruby-lang.org/en/documentation/installation/) properly
2. Make sure you have [Bundler installed](http://bundler.io/)
3. Install the Rails gem


### How to run this application
```
1. $ git clone https://github.com/Collaboration-Contracts/Contracts.git
2. $ cd Contracts/
3. $ bundle install
4. $ bundle exec rake db:create && bundle exec rake db:migrate` # to create your local databases
5. $ rails s # and then visit http://127.0.0.1:3000 to visit the application
```

### How to execute Cucumber tests
1. `bundle exec rake cucumber` - runs completed tests that should pass
2. `bundle exec rake cucumber:wip` - runs tests under development and may not pass (limit 3)
3. `bundle exec rake cucumber:dev_ready` - runs tests that are defined but not developed and should not pass
4. `bundle exec rake cucumber:all` - runs all tests regardless of tags

### How to run full test suite
`bundle exec rake ci:tests` - runs full suite tested by travis
