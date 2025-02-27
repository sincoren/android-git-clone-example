#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # adding teams from WINNER column
  if [[ $WINNER != 'winner' ]]
  then
    INSERT_NEW_TEAM=$( $PSQL "insert into teams(name) values('$WINNER') on conflict(name) do nothing")
  fi
  # adding teams from OPPONENT column
  if [[ $OPPONENT != 'opponent' ]]
  then
    INSERT_NEW_TEAM=$( $PSQL "insert into teams(name) values('$OPPONENT') on conflict(name) do nothing")
  fi
  
done
echo "total num of teams is counted $( $PSQL "select count(*) from teams" )"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    GET_WINNER_ID=$( $PSQL "select team_id from teams where name = '$WINNER'")
    GET_OPPONENT_ID=$( $PSQL "select team_id from teams where name = '$OPPONENT'")

    FILL_GAMES_TABLE=$( $PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $GET_WINNER_ID, $GET_OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)" )
  fi
done