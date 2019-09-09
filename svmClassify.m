doc1 = fopen('SPAMTrainLabel.txt','r');
label = textscan(doc1,'%s');
labelDoc=label{1,1};
j=1;
feature=importdata('Train50.txt');
for i =1:length(labelDoc)
    if mod( i , 2 )~=0
       x(j,1)=labelDoc(i,:);
       j=j+1;
    end
end
%feature=CreateFeature();
y=x(1:51,:);
z=y(1,1);
lf=length(feature);
ls=size(feature);
for k=1:ls
    z=y(k,1); 
   feature(k,lf+1)=str2double(z{1,1});
end   
 X=feature(1:51,1:end-1);
 Y=feature(1:51,end);
% X1=feature(40:78,1:end-1);
% Y1=feature(40:78,end);
% lm=size(X,1);
allX=feature(1:51,1:end-1);
allY=feature(1:51,end);
figure;
svmStruct = svmtrain(allX,allY,'ShowPlot',true);
group = svmclassify(svmStruct,Sample,'Showplot',true);