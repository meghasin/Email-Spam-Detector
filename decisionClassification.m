doc = fopen('SPAMTrainLabel.txt','r');
label = textscan(doc,'%s');
labelDoc=label{1,1};
j=1;
for i =1:length(labelDoc)
    if mod( i , 2 )~=0
       x(j,1)=labelDoc(i,:);
       j=j+1;
    end
end
feature=CreateFeature();
y=x(1:20,:);
z=y(1,1);

for k=1:11
    z=y(k,1); 
   feature(k,970)=str2double(z{1,1});
end   
X=feature(1:39,1:end-1);
Y=feature(1:39,end);
X1=feature(40:78,1:end-1);
Y1=feature(40:78,end);
tree = fitctree(X,Y); 

yp = predict(tree,X(1,:));
f_error=finderror(tree,X1,Y);