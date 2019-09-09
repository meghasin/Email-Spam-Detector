function FeatureMat = CreateFeature()
FeatureMat=[];
files = dir('TRAIN_*.txt');
C = [];
for file = files'
    word_indices=[];
    [word_indices, D] = CreateWordIndices(file.name);
n = length(D);
x = [];
x = [x;word_indices];
FeatureMat=vertcat(FeatureMat,x);
   
end
