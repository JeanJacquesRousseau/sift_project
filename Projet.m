% Projet Traitement d'image INF8725

image = imread('droite.jpg');

matriceKeypoints = ones(size(image));





% on calcul les gradients de tous les pixels de l'image
%[m,t]= get_gradient(image,matriceKeypoints);

% On retient une matrice 16x16 des pixels de l'image autour du point
% du point clée
%       ^
%       |
%      (8)
%       |
% <-(7)-KP-(8)->
%       |
%      (7)
%       |
%       v

kp = eye(564,564);
vec = getMatriceKP(image,kp);



% On fait la rotation de de cette matrice avec l'orientation du point clé


% Pour chaque pixel, on pondère les orientations par leur magnitudes et par une gaussienne ayant
% 1,5 fois le sigma associé aux Keypoints

% On somme les orientations parmis des sous-région (4x4) de la matrice 16x16.
% parmi un 

% On cherche l'orientation qui a 