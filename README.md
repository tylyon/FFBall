#FooBall

[![Build Status](https://travis-ci.org/tylyon/FFBall.svg)](https://travis-ci.org/tylyon/FFBall) [![Code Climate](https://codeclimate.com/github/tylyon/FFBall/badges/gpa.svg)](https://codeclimate.com/github/tylyon/FFBall) [![Coverage Status](https://coveralls.io/repos/tylyon/FFBall/badge.svg?branch=master)](https://coveralls.io/r/tylyon/FFBall?branch=master)
**IMPORTANT**

*Setup Walkthrough*
1. From your terminal run the following commands in the root directory of your cloned folder:
+bundle install
+rake db:create
+rake db:migrate
+rake db:seed
+rails s
2. Visit [http://localhost:3000](http://localhost:3000)
3. There is an option to sign up. I would advise not going through the process because:
+You need to create a league
+You need to fill the league with teams
+You need to fill the teams with players via the draft<br>
Instead, sign in as a user from the db/seeds.rb file.<br>
You will probably want to choose the user assigned with<br>
the league commissioner's id, which will give you permission to start the draft<br>
4. Code has mostly not been refactored. Basic gist of the setup is:
+A visitor can create a user
+A user can create a league, thus becoming its commissioner
+A league has a set amount of teams
+A user can create a team for that league, either immediately as commissioner or<br>
via privately sharing the League ID and entering it in the signup page.
+Once the league has hit the set amount of teams, the commissioner can initiate the draft
+Once the draft has begun, the commissioner must manually enter each draft pick
+Only auction drafts are available at the moment
+A new draft page renders with each pick. Teams are updated and their changes reflected via re-rendering
+The draft is potentially neverending. I haven't gotten to that point.<br>
Testing will be difficult/not desirable due to large amounts of factories,<br>
but most importantly, the amount of javascript that will be needed in order for the app to<br>
perform reasonably.
+If the draft does complete, each team will have its changes reflected in their team page

##User Stories
  As an authenticated user
  I want to create a league
  So that I can invite my friends to it
###Acceptance Criteria
* If I'm signed in, I have an option to create a league
* If I'm not signed in, I cannot create a league
* I am required to specify the amount of members
* I am required to specify the league name
* I am able to provide a league password
* I am able to provide email addresses to invite users
* I am able to change the league name after creation
* I am able to delete the league after creation,
  only if the league has less than the specified amount of members

  As an authenticated user
  I want to create a team
  So that I can join the league
###Acceptance Criteria
* If I'm signed in and have been invited to a league, I have an option to create a team
* If I'm not signed in, I cannot create a team
* I am able to add players to the team
* I am able to change the team name after creation
* I am able to delete the team after creation,
  only if its league has less than the specified amount of members

  As an authenticated user
  I want to view and add free agents
  So that I can field a roster
###Acceptance Criteria
* If I'm not signed in, I cannot view free agents
* If I am signed in but not a member of a particular league,
  then I cannot view that league's free agents
* If I'm signed in and a member of a league, I can view that league's free agents
* Each player has the option to add to my team
* When adding a player, I am brought back to my team page,
  with that player newly added to my roster

-- for later: --
  As an authenticated user
  I want to draft players
  So that I can populate my team
###Acceptance Criteria
* If I'm signed in, I can join the draft
* If I'm not signed in, I can't join the draft
* I am able to nominate the next player
* I am able to bid on that player
* That player is drafted by a team when the bidding clock runs out
* A team cannot bid over their team's max bid value
* A team cannot bid on players once their roster is full

  As an authenticated user
  I want to add free agents to my team
  So that I can make my team better
###Acceptance Criteria
* If I'm signed in, there is an option to view free agents for a league
* If I'm not signed in, I cannot view a league's free agents
* Free agents are comprised of all available players who do not belong to a team
* Free agents follow the league's waivier policies
* I am able to search free agents by first or last name
* I am able to filter free agents by position
* I am able to sort free agents by statistical category
* I am able to filter statistical categories by various scopes and conditions
* When adding a player, I must have an open roster spot for that player,
  otherwise, I must drop a player who is currently on my team
* The player I drop follows the league's waivier policies

  As a league commissioner
  I want to set the league settings
  So that I can customize how my league operates
###Acceptance Criteria
* If I'm signed in as the league commissioner,
  there is an option to change the league settings
* I am able to change stat scoring
* I am able to change waivier policies
* I am able to change playoff format
* I am able to change league format
* I am able to change league attributes (dynasty, amount of keepers, etc)












