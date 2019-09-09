function D = CreateDict()
files = dir('TRAIN_*.txt');
C = [];
for file = files'
%B=importdata('TEST_00002.txt');
% docvocab = fopen('spam_email_train_vocab.txt','r');
% labelvocab = textscan(docvocab,'%s');
% labelDocvocab=labelvocab{1,1};
% k=1;
% for i =1:length(labelDocvocab)
%     if mod( i , 2 )==0
%        xvocab(1,k)=labelDocvocab(i,:);
%        k=k+1;
%     end
% end
B=[];
B = textread(file.name, '%s', 'delimiter', '\n');
%B=importdata(file.name);
B = regexprep(B, '<.*?>',' ');
B = regexprep(B, '<[^<>]+>', ' ');
B = regexprep(B, '[0-9]+', 'number');
B = regexprep(B, '[^\s]+@[^\s]+', 'emailaddr');
B = regexprep(B, '(http|https)://[^\s]*', 'httpaddr');

% Handle $ sign
B = regexprep(B, '[$]+', 'dollar');
%strsplt = string({'a','an','the','on','in','who','where'});
for i=1:length(B)
    if ~isempty(B{i})
        C = [C strsplit(B{i}, {'=','*','-','/', ' ', ',', ':', '.', ';','&','!','#','(',')','<','>','"','$','%'})];
     
    end
end
end
D=unique(C);
D=D(:,4:end);