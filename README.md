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

## Design approach
This project parse a web server log file with interact of 5 classes:

* `DataKeeper`: responsible for storing extracted data from file into a hash with page as key and an array of ips that viewed the page.

* `Reeder`: responsible for reading each line of the log file and if it is a valid line add it to the DataKeeper.

* `Validator`: responsible for checking the validity of each line of the web server log file. The validator checks whether the string matches the pattern of URL and IP or not.

* `Counter`: responsible for counting the number of total and unique views per page.

* `Printer`: responsible for printing the result of the Counter to the console.


The start point of the project is `parser.rb` script.
