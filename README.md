# log-parser

This is a Ruby project that parses a log file and prints the nubmer of unique and total views per page.

## Installation

First clone the repository. Then on your terminal go to the root directory of the project and run:

```
bundle install
```

This command installs all the dependecies.

## Run

In order to run the project, on your terminal run command below:

```
chmode +x parser.rb
```
This command adds executable permission to the `parser.rb` for all users. Then run:

```
./parser.rb webserver.log
```

## Test and Lint

Rspec is utilized to write test and Rubocop to lint the code. To run
tests run:

```
bundle exec rspec
```

and to run rubocop:

```
 bundle exec rubocop
```
