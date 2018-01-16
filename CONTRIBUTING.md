# Contributing

First of all, thank you for your interest in contributing to Collaboration Contracts.
<!-- By participating in this project, you agree to abide by the CTO2 [code of conduct](https://wearect02.com/open-source-code-of-conduct) -->


## Getting Started
* Fork, then clone the repo
    * git clone git@github.com:Collaboration-Contracts/Contracts.git
* Confirm the app runs
  ```
  1. $ bundle install
  2. $ bundle exec rake db:create && bundle exec rake db:migrate` # to create your local databases
  3. $ rails s # and then visit http://127.0.0.1:3000 to visit the application
  ```
* Make sure the tests pass
  * cucumber: `bundle exec rake cucumber`

## Making Changes

* Create a topic branch from where you want to base your work.
  * This is usually the master branch.
  * Only target release branches if you are certain your fix must be on that
    branch.
  * To quickly create a topic branch based on master, run `git checkout -b
    fix/master/my_contribution master`. Please avoid working directly on the
    `master` branch.
* Make commits of logical units.
* Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure your commit messages are in the [proper format](https://github.com/Collaboration-Contracts/Contracts/wiki/Writing-Good-Commit-Messages).
* Make sure you have added the necessary tests for your changes.
* Run _all_ the tests to assure nothing else was accidentally broken.

## Submitting Changes

* Push your changes to a topic branch in your fork of the repository.
* Submit a pull request to the Contracts repository in the Collaboration Contracts organization.
* The core team looks at Pull Requests frequently
