# Elise Shaffer Approach

I started from the outside in. My appraoch was to create things as they would be needed by a user. 

## Process
### Login Page
I started with the login page. I followed the example given in the greeter, where a controller loads variables and passes them to a view which renders a react component. I also tried to add system tests, but ran into issues with chromedriver. I didn't want to lose a lot of time trying to get the tests working, so I pivoted to solving the problem.

### Write In Candidate
Once the login page was working, I moved on to a write in candidate as the first use case. I made this choice because when the first user uses the voting machine, there would be no candidates. 

### Select From Previous Candidates
Then, I added the list of candidates and a method to vote for them via a radio select using the same action to perform the vote record

## Decisions

### Voter Logging

I chose to add voters as a table with a voted_at timestamp. I made this decision because the instructions said to assume good faith. An alternative that I would consider in a more robust system would be logging each vote in either a column on the voter table or as a join between voters and candidates. 

### Testing

I normally try to follow TDD, but I ran into issues with the tests and didn't want to lose time trying to fix them. The tests I've included are intended to show my approach to testing, but I have not run them. 

