cam_num = 4;
Nenvir = cell(cam_num, 1);

for i=1:cam_num
    [K, kc] = readradfile(['camerapara/Camera', num2str(i) '.rad']);
    save(['came_mat/internal_', num2str(i), '.mat'], 'K', 'kc');

    P = dlmread(['camerapara/camera', num2str(i), '.Pmat.cal']);
    save(['came_mat/Pmat', num2str(i), '.mat'], 'P');
    
    [R, t] = readextfile(['camerapara/camera1', num2str(i), '.cal']);
    save(['came_mat/extR', num2str(i), '.mat'], 'R');
    save(['came_mat/extt', num2str(i), '.mat'], 't');
    ext = [R t'];
    save(['came_mat/ext', num2str(i), '.mat'], 'ext');

    Nenvir{i}.R = R;
    Nenvir{i}.T = t';
    Nenvir{i}.om = rodrigues(R);
    Nenvir{i}.fc = [K(1,1); K(2,2)];
    Nenvir{i}.cc = [K(3,1); K(3,2)];
    Nenvir{i}.kc = [kc, 0]';
    Nenvir{i}.alpha_c = K(1,2) / K(1,1);
    
end

Nenvir{1}

save('came_mat/Nenvir.mat', 'Nenvir');

file = fopen('calib_Rti', 'w');
for i=1:cam_num
    disp(Nenvir{i});
end
