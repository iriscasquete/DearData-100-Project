//journeys csv
Table journeys;
//arrays
  //Transport names
  String[] transportTypes = {
    "DLR", "NORTHERN", "BUS", "ELIZABETH", "CENTRAL", "HAMMERSMITH", "JUBILEE", 
    "BAKERLOO" };
  int[] transportCounts = new int[transportTypes.length];
  
  //Day names
  String[] dayNames= {
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
    int[] dayCounts = new int[dayNames.length];
    
  //Crowding levels
  String[] levels = {
    "1 Empty", "2 Quiet", "3 Busy", "4 Crowded", "5 Packed"}; 
    int[] crowdingCounts = new int[5];
    
  //Feelings Types
  String[] feelingTypes = {
    "Comfortable", "Neutral", "Uncomfortable", "Stressed", "Tired", 
    "Unwell", "Happy"};
    int[] feelingCounts = new int[feelingTypes.length];

void setup() {
  size(1200, 800);
  journeys = loadTable("journeys.csv", "header");
  println("Total observations:" + journeys.getRowCount());
  println("First Trasnport:" + journeys.getString(0, 4));
  println("Second line:" + journeys.getString(0, 7));
//transports counting  
  for (int i=0; i< journeys.getRowCount(); i++){
    String transport = journeys.getString(i, 4);
    for (int j = 0; j < transportTypes.length; j++){
      if (transport.equalsIgnoreCase(transportTypes[j])){
        transportCounts[j]++;
      }
    }
  }//print transport types
  for (int j = 0; j < transportTypes.length; j++){
    println(transportTypes[j] + ":" + transportCounts[j]);
  }
//Count journeys for each day
  for(int i = 0; i< journeys.getRowCount(); i++){
    String day = journeys.getString(i, 2).trim();
    for (int j = 0; j < dayNames.length; j++){
      if (day.equalsIgnoreCase(dayNames[j])){
        dayCounts[j]++;
      }
    }
  }//print day names
  for (int j = 0; j < dayNames.length; j++){
    println(dayNames[j] + ":" + dayCounts[j]);
  }
//Count journeys by crowding level
  for (int i = 0; i < journeys.getRowCount(); i++){
    String crowding = journeys.getString(i, 6).trim();
      if(crowding.length() > 0){
        String firstNumber = crowding.substring(0, 1);
        int level = int(firstNumber);
        if (level >= 1 && level <=5){
          crowdingCounts[level - 1 ]++;
       }
    }
 }// print crowding level
  for (int i = 0; i < crowdingCounts.length; i++){
    println("Crowding Level" + (i + 1) + ":" + crowdingCounts[i]);
  }
//Count feelings
  for (int i = 0; i < journeys.getRowCount(); i++){
    String feeling = journeys.getString(i, 7).trim();
    for (int j = 0; j < feelingTypes.length; j++){
      if (feeling.equalsIgnoreCase(feelingTypes[j])){
        feelingCounts[j]++;
      }
    }
  }
  for (int j = 0; j < feelingTypes.length; j++){
  println(feelingTypes[j] + ":" + feelingCounts[j]);
  }
}
void draw() {
  background(250,213,179);
//main title
  fill(0);
  textAlign(CENTER);
  textSize(38);
  text("100 Journeys, 100 Experience", width/2, 55);
//dashboard sections
  fill(255);
  rect(40, 100, 540, 300);
  rect(620, 100, 540, 300);
  rect(40, 430, 540, 300);
  rect(620, 430, 540, 300);
//section titles
  fill(0);
  textSize(20);
  text("Transport Type", 310, 135);
  text("Day of the Week", 890, 135);
  text("Crowding Level", 310, 465);
  text("Feelings", 890, 465);
  //Calling Methods
  drawTransportChart();
  drawDayChart();
  drawCrowdingChart();
  drawFeelingChart();
}
//method for drewing type
void drawTransportChart(){
  textAlign(LEFT);
  textSize(13);
  for (int i = 0; i < transportTypes.length; i++) {
    float y = 160 + i * 27;
    float barWidth = transportCounts[i] * 15;
  //Drewing chart
    fill(0);
    text(transportTypes[i], 65, y + 13);
    fill(70, 145, 200);
    rect(195, y, barWidth, 16);
    fill(0);
    text(transportCounts[i], 205 + barWidth, y + 13);
  }
}
//method for drewing Day
void drawDayChart(){
  textAlign(CENTER);
  textSize(13);
  for (int i = 0; i < dayNames.length; i++){
    float x = 655 + i * 70;
    float barHeight = dayCounts[i] * 10;
   //Drewing chart
    fill(155, 130, 200);
    rect(x, 350 - barHeight, 42, barHeight);
    fill(0);
    text(dayCounts[i], x + 21, 340 - barHeight);
    text(dayNames[i].substring(0, 3), x + 21, 375);
  }
}
//method for drawing crowding level
void drawCrowdingChart(){
  textAlign(CENTER);
  textSize(13);
  for (int i = 0; i < crowdingCounts.length; i++){
    float x = 90 + i * 100;
    float barHeight = crowdingCounts[i] * 8;
    //Drewing chart
    fill(80, 170, 140);
    rect(x, 680 - barHeight, 50, barHeight);
    fill(0);
    text(crowdingCounts[i], x + 25, 670 - barHeight);
    text(levels[i], x + 25, 705);
  }
}
//method for drewing feeling type
void drawFeelingChart(){
  textAlign(LEFT);
  textSize(13);
  for (int i = 0; i < feelingTypes.length; i++){
    float y = 500 + i * 29;
    float barWidth = feelingCounts[i] * 12;
    //drawing chart
    fill(0);
    text(feelingTypes[i], 650, y + 13);
    fill(220, 130, 160);
    rect(830, y, barWidth, 17);
    fill(0);
    text(feelingCounts[i], 840 + barWidth, y + 13);
  }
}
  
  
  
  
  
  
  
