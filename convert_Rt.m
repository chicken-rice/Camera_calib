load("came_mat/Nenvir0724_1.mat");
disp(size(Nenvir));

ConvRt = cell(4, 1);
ConvRt{1}.R = [1 0 0; 0 1 0; 0 0 1];
ConvRt{1}.T = [0;0;0];

r_R1 = inv(Nenvir{1}.R);
r_t1 = -r_R1*Nenvir{1}.T;

for i= 1:size(Nenvir, 1)
    R = Nenvir{i}.R;
    t = Nenvir{i}.T;

    ConvRt{i}.R = R*r_R1;
    ConvRt{i}.T = R*r_t1+t;
end

pos = rand(3,1);
disp("pos");
disp(pos);
pos1 = [Nenvir{1}.R Nenvir{1}.T]*[pos;1];
pos2 = [Nenvir{2}.R Nenvir{2}.T]*[pos;1];

disp("pos1");
disp(pos1);
disp("pos2");
disp(pos2);

NewPos2 = [ConvRt{2}.R ConvRt{2}.T]*[pos1;1];
disp("NewPos2");
disp(NewPos2);
