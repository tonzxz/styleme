import cv2
import numpy as np

def transfer_hairstyle(source_img_path, target_img_path, output_img_path):
    # Read images
    source_img = cv2.imread(source_img_path)
    target_img = cv2.imread(target_img_path)

    # Convert to grayscale
    source_gray = cv2.cvtColor(source_img, cv2.COLOR_BGR2GRAY)

    # Detect keypoints and descriptors
    sift = cv2.SIFT_create()
    keypoints_source, descriptors_source = sift.detectAndCompute(source_gray, None)
    keypoints_target, descriptors_target = sift.detectAndCompute(target_img, None)

    # Match keypoints
    matcher = cv2.BFMatcher()
    matches = matcher.match(descriptors_source, descriptors_target)

    # Sort matches by distance
    matches = sorted(matches, key=lambda x: x.distance)

    # Draw matches
    matched_img = cv2.drawMatches(source_img, keypoints_source, target_img, keypoints_target, matches[:20], None, flags=cv2.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)

    # Save the result
    cv2.imwrite(output_img_path, matched_img)

if __name__ == "__main__":
    source_image_path = "./round.png"
    target_image_path = "./sample.jpg"
    output_image_path = "./output.jpg"

    transfer_hairstyle(source_image_path, target_image_path, output_image_path)