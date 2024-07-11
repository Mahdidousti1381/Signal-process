function picture=select_image()
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},['First choose ' ...
    'PCB image and then choose IC image']);
s=[path,file];
picture=imread(s);
end
