# log-parser

This is a Ruby project that parses a log file and prints the number of unique and total views per page.

## Installation

First clone the repository. Then on your terminal go to the root directory of the project and run:

```
bundle install
```

This command installs all the dependencies.

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
This project parses a web server log file and prints out the statistics through the interaction of the following classes:

* `DataKeeper`: is responsible for storing the extracted data from log file into a hash with the page url as the key and an array of IPs that viewed the page as the value.

* `Reader`: is responsible for reading the log file one line at a time and adding it to the `DataKeeper` if it is a valid log line.

* `Validator`: is responsible for checking the validity of each line of the web server log. The validator checks whether the string matches a pattern of a URL and an IP address.

* `Counter`: is responsible for counting the number of total and unique views per page.

* `Printer`: is responsible for formatting the desired outputs and printing them to the console.


The entry point of the project is `parser.rb` script. `Reader` takes the file path and an instance of `DataKeeper` as arguments. `Reader` utilizes an instance of `Validator` per line and sends `add` message with a valid line as argument to the received instance of `DataKeeper`. `DataKeeper` splits and stores the line in its internal data structure which is a Hash. This process will perform while there is unprocessed line in the log file.
Then `Counter` gets the same instance of `DataKeeper` which has already had the organized data and `Printer` receives the `Counter` instance.
Finally, `parser` sends double `print_views` messages to the `Printer` instance for printing total and unique page views respectively.
