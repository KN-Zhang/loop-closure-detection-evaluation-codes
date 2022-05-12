# Evaluation codes for loop closure detection
This is an evaluation code for loop closure detection (LCD) tasks. We generate multiple tuples of **(Precision, Recall)** for each testing dataset, followed by searching **the maximum recall rate at 100% precision (MR)** as the final metric. The related precision-recall curve is as follow:
![image](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/data/pr_curve.png)

# General pipeline
Our previous work mainly focused on proposing LCD-specific feature matching methods to gain better LCD performance. Thus our **(Precision, Recall)** tuples are generated according to the number of preserved inliers after the feature matching procedure. The detailed evaluation pipeline is as follow:
1. Generate an *NxN* null matrix **M**  with *N* indicating the size of the testing dataset. For example, there are totally 4541 images in the KITTI 00 sequence, thereby *N=4541*.
2. Denote by *qIdx* and *rIdx* the index of the query image and the reference image, respectively. Then we record the number of preserved inliers between these two images in **M**(*qIdx*,*rIdx*). [cc_LPM.mat](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/data/cc_LPM.mat) and [cc_MAGSAC++.mat](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/data/cc_MAGSAC%2B%2B.mat) are two match results of [LPM](https://github.com/jiayi-ma/LPM) and [MAGSAC++](https://github.com/ducha-aiki/pymagsac) on the CityCentre dataset.
