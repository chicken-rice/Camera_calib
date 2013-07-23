cam_num = 4;
CPara = cell(cam_num, 1);

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

    CPara{i}.K = K;
    CPara{i}.kc = kc;
    CPara{i}.P = P;
    CPara{i}.R = R;
    CPara{i}.t = t;
    CPara{i}.ext = ext;
end

save('came_mat/CPara.mat', 'CPara');
