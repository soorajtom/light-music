#define SENSOR_PIN 15  // Adjust if using a different GPIO

void setup() {
  Serial.begin(115200);  // Initialize serial communication at 115200 baud
  pinMode(SENSOR_PIN, INPUT);  // Configure GPIO pin as input
}

void loop() {
  int sensorState = digitalRead(SENSOR_PIN);  // Read the sensor's state

  // Print the result to the Serial Monitor
  if (sensorState == HIGH) {
    Serial.println("No IR light detected (hole blocked)");
  } else {
    Serial.println("IR light detected (hole open)");
  }

  delay(500);  // Add a small delay to avoid spamming the serial monitor
}
