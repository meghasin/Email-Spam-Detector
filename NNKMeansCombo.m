%Nueral Networks combined with K means (we call it NN-KM[Nueral Networks-K Means])
%tic

x = load('Features.txt');
t= load('newLabels.txt');
%First run K means on the data:
[result,cluster]=KmeansCluster(2, 10, x);
size1 = 1;
size2 = 1;
c1 = [];
c2 = [];
t1 = [];
t2 = [];
%Seperate the cluster data into two sets
for i = 1:size(cluster)
   if cluster(i) == 1
       c1(size1) = x(i);
       t1(size1) = t(i);
       size1 = size1 + 1;
   else
       c2(size2) = x(i);
       t2(size2) = t(i);
       size2 = size2 + 1;
   end
end

%Run set 1 and set 2 in Neural Networks seperately
tic
[performance1,percentErrors1,trainPerformance1,valPerformance1,testPerformance1]  = NeuralNetworkAdvanced(c1,t1)
toc
tic
[performance2,percentErrors2,trainPerformance2,valPerformance2,testPerformance2]  = NeuralNetworkAdvanced(c2,t2)
toc
%Average the results between the two nueral network runs:

if performance1 < 0.5
    performance1 = 1.0-performance1
    r = 0
end
if performance2 < 0.5
    performance2 = 1.0-performance2
    r = 1
end

performance = (performance1 + performance2)/2
percentErrors = (percentErrors1 + percentErrors2)/2
trainPerformance = (trainPerformance1 + trainPerformance2)/2
valPerformance = (valPerformance1 + valPerformance2)/2
testPerformance = (testPerformance1 + testPerformance2)/2
%toc