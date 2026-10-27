//journeys csv
Table journeys;
//Transport names
String[] transportTypes = {
  "DLR", "NORTHERN", "BUS", "ELIZABETH", "CENTRAL", "HAMMERSMITH", "JUBILEE", "BAKERLOO"
};

int[] transportCounts = new int[transportTypes.length];

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
  }
  for (int j = 0; j < transportTypes.length; j++){
    println(transportTypes[j] + ":" + transportCounts[j]);
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
  
  drawTransportChart();
}
//drewing the transport
void drawTransportChart(){
  textAlign(LEFT);
  textSize(13);
  
  for (int i = 0; i < transportTypes.length; i++) {
    float y = 160 + i * 27;
    float barWidth = transportCounts[i] * 15;
    
    fill(0);
    text(transportTypes[i], 65, y + 13);
    
    fill(70, 145, 200);
    rect(195, y, barWidth, 16);
    
    fill(0);
    text(transportCounts[i], 205 + barWidth, y + 13);
  }
}
  
  
  
  
  
  
  
  
