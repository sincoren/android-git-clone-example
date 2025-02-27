#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

AVAILABLE_SERVICES=$( $PSQL "select service_id, name from services")

GET_SERVISES(){
if [[ -z $AVAILABLE_SERVICES ]]
then
  echo "Sorry, no services available. Try later."
else
  echo -e "\nHere are the available services:"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done
fi

}

MAIN_LOGIC(){
  GET_SERVISES
  read SERVICE_ID_SELECTED
  SERCHING_SERVICE=$( $PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED ")
  if [[ -z $SERCHING_SERVICE ]]
  then
    echo -e "\nSorry, you provided the wrong number. Try again.";
    GET_SERVISES
  else
    CHOSEN_SERVICE=$( $PSQL "select name from services where service_id = $SERVICE_ID_SELECTED" )
    echo -e "\nGreat, you chose '$CHOSEN_SERVICE'." | sed "s/' /'/g" -E
    echo -e "\nPlease, enter your phone number:"
    read CUSTOMER_PHONE
    SEARCHING_CUSTOMER=$( $PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE' " )

    if [[ -z $SEARCHING_CUSTOMER ]]
    then
      echo -e "\nPlease, enter your name"
      read CUSTOMER_NAME
      echo -e "\nPlease, enter time for your appointment:"
      read SERVICE_TIME
      #echo -e "\nPlease, enter your phone:":
      #read CUSTOMER_PHONE;
      #echo -e "\nPlease, enter the service you chose:":
      #read SERVICE_ID_SELECTED;
      
      ADDING_NEW_CUSTOMER=$( $PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')" )
      GET_CUSTOMER_ID=$( $PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'" )



      ADDING_NEW_APPOINTMENT=$( $PSQL "insert into appointments(customer_id, service_id, time) values($GET_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" )
      echo -e "\nI have put you down for a $CHOSEN_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo -e "\nPlease, write the time for an appointment:"
      read SERVICE_TIME
      

      GET_CUSTOMER_ID=$( $PSQL "select customer_id from customers where phone = $CUSTOMER_PHONE" )
      echo $GET_CUSTOMER_ID – $SERVICE_ID_SELECTED
      ADDING_NEW_APPOINTMENT=$( $PSQL "insert into appointments(customer_id, service_id, time) values($GET_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" )
      echo -e $SEARCHING_CUSTOMER | while READ CUSTOMER_ID BAR CUSTOMER_PHONE BAR CUSTOMER_NAME
      do
        echo -e "\nI have put you down for a $CHOSEN_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
      done
    fi
  fi
}


MAIN_LOGIC