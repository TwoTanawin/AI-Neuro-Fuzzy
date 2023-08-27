a = [-1 1; 0 -2];
[eigenvectors, eigenvalues] = eig(a);

disp("Eigenvalues:");
disp(diag(eigenvalues));

disp("Eigenvectors:");
disp(eigenvectors);
