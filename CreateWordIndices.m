function [count, D] = CreateWordIndices(email)
F=[];B=[];D=[];
D= CreateDict();
word_indices=[];
count=[];
B = textread(email, '%s', 'delimiter', '\n');
%B=importdata(file.name);
B = regexprep(B, '<.*?>',' ');
B = regexprep(B, '<[^<>]+>', ' ');
B = regexprep(B, '[0-9]+', 'number');
B = regexprep(B, '[^\s]+@[^\s]+', 'emailaddr');
B = regexprep(B, '(http|https)://[^\s]*', 'httpaddr');

% Handle $ sign
B = regexprep(B, '[$]+', 'dollar');
for i=1:length(B)
    if ~isempty(B{i})
        F = [F strsplit(B{i}, {'=','*','-','/', ' ', ',', ':', '.', ';','&','!','#','(',')','<','>','"','$','%'})];
    end
end
count=countmember(D,F);
% for i=1:length(F)
%       if ~isempty(F{i})
%         word_indices = [word_indices; strmatch(F{i}, D,'exact')];
%         
%       end
% end

