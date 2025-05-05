import cvzone
import cv2

cap = cv2.VideoCapture(0)
cap.set(3, 1920)
cap.set(4, 1920)

detector = cvzone.HandDetector(maxHands=1, detectionCon=1)
mySerial = cvzone.SerialObject("COM3", 115200, 1)

while True:
    success, img = cap.read()
    if not success:
        continue

    img = detector.findHands(img)
    lmList, bbox = detector.findPosition(img)

    if lmList:
        # [thumb, index, middle, ring, pinky] => 0/1
        fingers = detector.fingersUp()

        # No invertimos ni reordenamos
        # Enviamos directamente:
        mySerial.sendData(fingers)
        print("fingers raw:", fingers)

    cv2.imshow("Image", img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
