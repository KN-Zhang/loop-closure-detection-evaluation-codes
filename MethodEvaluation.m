clear; close all;
%% load results of feature matching
load('./data/cc_MAGSAC++.mat');
%% load ground truth 
%%%% citycentre %%%%
load('./GT/city_GT_final.mat');
truth=GT;

aaAAA

%%%% kitti00 %%%%
% load('./GT/groundTruth_KITTI00.mat');
% truth=double(groundTruthMatrixKITTI00_ICRA18);

%%%% newcollege %%%%
% load('./GT/newcollege_GT.mat');
% truth=gt';

%%%% bicocca %%%%
% load('./GT/new_GT_biccoca.mat');
% truth=new_GT_biccoca(1:15:end,1:15:end)';

%%%% malaga %%%%
% load('./GT/malaga_GT_final.mat');
% truth=GT;

%%%% lip6outdoor %%%%
% load('./GT/Lip6OutdoorGroundTruth.mat');

%%%% lip6indoor %%%%
% load('./GT/Lip6IndoorGroundTruth.mat');

%%%% newcollege1073 %%%%
% load('./GT/NewCollegeGroundTruth.mat');
% truth=truth(1:2:end,1:2:end);

%%%% kitti05 %%%%
% load('./GT/groundTruth_KITTI_05.mat');
% truth=groundTruthMatrixKITTI05_ICRA18;
% truth=[truth;zeros(1,2761)];
% truth=[truth zeros(2762,1)];

%%%% kitti06 %%%%
% load('./GT/kitti06GroundTruth.mat');
% truth=[truth;zeros(3,1101)];
% truth=[truth zeros(1104,3)];

%%%% kitti02 %%%%
% load('./GT/kitti02GroundTruth.mat');
% truth=[truth;zeros(2,4661)];
% truth=[truth zeros(4663,2)];

%%%% st100909_1210 %%%%
% load('./GT/100909_1210_GT_labeled.mat');
% truth=GT;

%%%% st100909_1410 %%%%
% load('./GT/100909_1410_GT_labeled.mat');
% truth=GT;

%%%% st180809_1545 %%%%
% load('./GT/180809_1545_GT_labeled.mat');
% truth=GT;

%%%% st190809_0845 %%%%
% load('./GT/190809_0845_GT_labeled.mat');
% truth=GT;

%% settings of the dataset
frame_rate=10; %% (Hz), number of frames captured per second
time_constant=40; %% (s), time in non-redundancy path

%%  evaluation for the maximum recall rate at 100% precision (MR)
Precision=[];
Recall=[];

%%images captured before the query one would not be considered whether they
%%meet the condition of being a candidate frame.
match_results=tril(match_results,-frame_rate*time_constant);

%%the tolerance of evaluation is set to 10 neighboring locations
TP_tol=conv2(truth,ones(1,2*10+1),'same')>0;

for tau=1:max(match_results(:))-1
   loopClosureMatrix= match_results>tau ;
   TruePositiveMatrix= loopClosureMatrix.* TP_tol;
   FalsePositiveMatrix= loopClosureMatrix.* not(TP_tol);
   
   FP_indicator=sum(FalsePositiveMatrix,2);
   TP_indicator=sum(TruePositiveMatrix,2)>0;
   
   pre=sum(TP_indicator)/(sum(TP_indicator)+sum(sum(FalsePositiveMatrix,2)>0));
   rec=sum(TP_indicator)/sum(sum(truth,2)>0);
   
   Precision=[Precision; pre];
   Recall=[Recall; rec];
end

result_ind=find(Precision==1);
result_ind=result_ind(1);
MR=Recall(result_ind)
