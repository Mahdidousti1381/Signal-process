function result = plot_box(PCB, Gray_IC, M_cell ,IC)
[IC_row, IC_col] = size(Gray_IC);
threshold = 0.9;
figure 
subplot(2,3,1)
imshow(PCB);
title('PCB image')
subplot(2,3,3)
imshow(IC);
title('IC image')
subplot(2,3,5)
imshow(PCB);
title('Matching Result')
hold on ;
for l=1:length(M_cell)
        [rows,cols]=find(M_cell{l}>threshold);

        for k=1:length(rows)
        rectangle('Position',[cols(k) rows(k) IC_col IC_row],'EdgeColor','r');
        end
end
F = getframe(gcf);
result = frame2im(F);
end