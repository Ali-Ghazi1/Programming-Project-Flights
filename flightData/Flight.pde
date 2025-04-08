class Flight {
  String airline, flightNumber;
  int scheduledDeparture, actualDeparture, scheduledArrival, actualArrival;
  
  Flight(TableRow row) {
    airline = row.getString("MKT_CARRIER");
    flightNumber = row.getString("MKT_CARRIER_FL_NUM");

    scheduledDeparture = row.getInt("CRS_DEP_TIME");
    scheduledArrival = row.getInt("CRS_ARR_TIME");

    String depTimeStr = row.getString("DEP_TIME");
    actualDeparture = (depTimeStr == null || depTimeStr.equals("")) ? 0 : row.getInt("DEP_TIME");

    String arrTimeStr = row.getString("ARR_TIME");
    actualArrival = (arrTimeStr == null || arrTimeStr.equals("")) ? 0 : row.getInt("ARR_TIME");
  }

  int getDelay() {
    if (actualArrival == 0) return 0;  // handle missing data

    int delay = actualArrival - scheduledArrival;
    
    // adjust for flights that arrive after midnight
    if (delay < -1200) delay += 2400;
    
    return delay;
  }
}
