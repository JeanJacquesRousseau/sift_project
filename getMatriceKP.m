function [vecOUT] = getMatriceKP(imageIN,imageKP)
% Cette fonction retourne un vecteur de taille nombreKP de matrices 16x16
% qui sont les régions autour des points clés


% On compte le nombre de keypoints dans imageKP
nombreKP = sum(imageKP(:)==1);

% On initialise le vecteur de nombreKP matrices 16x16
vecOUT = zeros(16,16,nombreKP);

% On verifie que la taille de imageKP et image IN sont la même
size_imIN = size(imageIN);
size_imKP = size(imageKP);


k=1;
for i = 8:(size_imKP(2)-8)
    for j = 9:(size_imKP(1)-7)
        if imageKP(j,i) == 1 
            if k <= nombreKP
                imGrad = imageIN((j-8):(j+7),(i-7):(i+8));
                vecOUT(:,:,k) =imGrad;
                k=k+1;
            end
        end
    end
end








end

