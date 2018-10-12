str='D:\code\matlab\GPSData\2018-10-10\11µã17¡ª¡ª11µã35·Ö\test100\';
[num,txt,raw]=xlsread([str, 'test100.xls']);
x=str2double(txt(:,1));
y=str2double(txt(:,2));
sx=str2double(txt(:,6));
sy=str2double(txt(:,7));
sz=str2double(txt(:,8));

fp=fopen([str, 'x.txt'] ,'w+');
fprintf(fp, '%f\r\n', x(1:end-1));
fprintf(fp, '%f', x(end));
fclose(fp);

fp=fopen([str, 'y.txt'] ,'w+');
fprintf(fp, '%f\r\n', y(1:end-1));
fprintf(fp, '%f', y(end));
fclose(fp);

fp=fopen([str, 'sx.txt'] ,'w+');
fprintf(fp, '%f\r\n', sx(1:end-1));
fprintf(fp, '%f', sx(end));
fclose(fp);

fp=fopen([str, 'sy.txt'] ,'w+');
fprintf(fp, '%f\r\n', sy(1:end-1));
fprintf(fp, '%f', sy(end));
fclose(fp);

fp=fopen([str, 'sz.txt'] ,'w+');
fprintf(fp, '%f\r\n', sz(1:end-1));
fprintf(fp, '%f', sz(end));
fclose(fp);