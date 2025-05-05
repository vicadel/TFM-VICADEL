import cvzone
import cv2

cap = cv2.VideoCapture(0)
detector = cvzone.HandDetector(maxHands=1, detectionCon=1)
mySerial = cvzone.SerialObject("COM3", 115200, 1)

while True:
    success, img = cap.read()
    if not success:
        continue

    img = detector.findHands(img)
    lmList, bbox = detector.findPosition(img)

    if lmList:
        fingers = detector.fingersUp()
        fingers = [1 - f for f in fingers]  # Invierte los valores

        print(fingers)
        mySerial.sendData(fingers)

    cv2.imshow("Image", img)
    cv2.waitKey(1)
