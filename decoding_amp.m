function decoding_amp(p,tollpayam,signal,bitrate,mapset)
kkkkkkkkkkkkk = linspace(0,0.99,100);
shenase=2*sin(2*pi*kkkkkkkkkkkkk);
flag1=[];
for u=1:length(signal)
  flag1(u)= round((dot(p(:,100*(u-1)+1:100*u),shenase)*(2^(bitrate)-1)/100));
end
decoding='11111';
for s=1:length(flag1)
    decoding=append(decoding,dec2bin(flag1(s),bitrate));
end

payam=cell(2,tollpayam/5);
for w=1:tollpayam/5
  payam{1,w} = extractBetween(decoding,6+(w-1)*5,10+(w-1)*5);
end

for q=1:size(payam,2)
    for z=1:32
        if strcmp(payam{1,q},mapset{2,z})==1
            payam{2,q}=mapset{1,z};
        end
    end
end
fprintf('payam=\n %s','');
for s=1:size(payam,2)
fprintf('%s',payam{2,s})
end
end

