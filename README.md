# Evaluation codes for loop closure detection
This is an evaluation code for loop closure detection (LCD) tasks. We generate multiple tuples of **(Precision, Recall)** for each testing dataset, followed by searching **the maximum recall rate at 100% precision (MR)** as the final metric. The related precision-recall curve is as follow:
![image](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/data/pr_curve.png)

# General pipeline
Our previous work mainly focused on proposing LCD-specific feature matching methods to gain better LCD performance. Thus our **(Precision, Recall)** tuples are generated according to the number of preserved inliers after the feature matching procedure. The detailed evaluation pipeline is as follow:
1. Generate an *NxN* null matrix **M**  with *N* indicating the size of the testing dataset. For example, there are totally 4541 images in the KITTI 00 sequence, thereby *N*=4541.
2. Denoting by *qIdx* and *rIdx* the index of the query image and the reference image, respectively, then we record the number of preserved inliers between these two images in **M**(*qIdx*,*rIdx*). [./data/cc_LPM.mat](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/data/cc_LPM.mat) and [./data/cc_MAGSAC++.mat](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/data/cc_MAGSAC%2B%2B.mat) are two match results of [LPM](https://github.com/jiayi-ma/LPM) and [MAGSAC++](https://github.com/ducha-aiki/pymagsac) on the CityCentre dataset. When you perform [MethodEvaluation.m](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/MethodEvaluation.m), you should first load your own match result matrix.
3. The ground truth files of some datasets are provided in [./GT/](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/tree/main/GT). They are presented in the form of a binary matrix, where **GT**(*i,j*)=1 indicates that a loop-closing event occurs while **GT**(*i,j*)=0 for otherwise. So if you are testing with new datasets, you should first add its ground truth file.
4. Run [MethodEvaluation.m](https://github.com/KN-Zhang/loop-closure-detection-evaluation-codes/blob/main/MethodEvaluation.m). You will get your **MR** result.

# BibTex Citation
If you find the codes useful, please consider citing [previous publication](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9457132). More details of the used datasets and the evaluation procedure can be found in it. 
```
@article{zhang2021appearance,
  title={Appearance-Based Loop Closure Detection via Locality-Driven Accurate Motion Field Learning},
  author={Zhang, Kaining and Jiang, Xingyu and Ma, Jiayi},
  journal={IEEE Transactions on Intelligent Transportation Systems},
  year={2021},
  publisher={IEEE}
}
```
