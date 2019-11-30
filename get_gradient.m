function [m, theta] = get_gradient(imageIN,imageKP)
% Cette fonction calcule les gradients de imageiN
% uniquement aux positions indiqués à l'intérieur de imageKP
% m est l'amplitude du gradient
% theta est l'angle du gradient

% On verifie que la taille de imageKP et image IN sont la même
size_imIN = size(imageIN);
size_imKP = size(imageKP);

if size_imIN(1) ~= size_imKP(1)
    error('La taille en X de l''image des keypoints n''est pas égale à celle de l''image à traiter');
end

if size_imIN(2) ~= size_imKP(2)
    error('La taille en Y de l''image des keypoints n''est pas égale à celle de l''image à traiter');
end

% On calcul les amplitudes et orientations des gradients aux keypoints

m = zeros(size_imIN(1),size_imIN(2));
theta = zeros(size_imIN(1),size_imIN(2));
% i est sur l'axe des x
% j est sur l'axe des y 
imageIN = double(imageIN);
for i = 2:(size_imKP(2)-1)
    for j = 2:(size_imKP(1)-1)
        if imageKP(j,i) == 1 
        
        % la sortie de atan est en radiant
        theta(j,i) = atan((imageIN(j+1,i)-imageIN(j-1,i))/(imageIN(j,i+1)-imageIN(j,i-1)));
        m(j,i) = sqrt((imageIN(j,i+1)-imageIN(j,i-1))^2 + (imageIN(j+1,i)-imageIN(j-1,i))^2);
        end
    end
end


    
end

