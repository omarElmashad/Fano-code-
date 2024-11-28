function fanoCode = fanoCoding(probabilities)
	probabilities = [0.3,0.35,0.1,0.2,0.005,0.04,0.005];
	negative_indices = find(probabilities < 0);
    if (sum(probabilities) >1) ||(~isempty(negative_indices)) 
        error('Probabilities connot be negative and probability sum cannot be grater than 1 ');
    end
    % Sort probabilities in descending order and store indices
    [sortedProb, indices] = sort(probabilities, 'descend');
	
    if sortedProb(1) == 1 
        disp('there isnot a codewords as there is an symbol probability=1 ');
        return ;
    end
    % Initialize a cell array for storing codewords
    codewords = cell(length(sortedProb), 1);
  
    fprintf('#Symbol\tProbability\tCodeword\n');
	% Generate the Fano codes recursively
    recursiveFano(sortedProb, codewords, 1, length(sortedProb), '');
end


