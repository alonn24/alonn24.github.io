import cv2 as cv
import pytesseract

video = cv.VideoCapture(0)


while True:
    ret, frame = video.read()
    if not ret:
        break
    cv.imshow('Mask', frame)
    if cv.waitKey(1) & 0xFF == ord('q'):
        break
    elif cv.waitKey(1) & 0xFF == ord('w'):
        print(pytesseract.image_to_string(frame))


cv.destroyAllWindows()
video.release()
