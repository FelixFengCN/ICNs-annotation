clc;clear;
celltype_name={'L2_3IT','L4IT','L6IT','L6ITCar3','L5IT','Lamp5','Sncg','Pax6','Lamp5Lhx6','Vip',...
    'L5ET','L5_6NP','L6CT','L6b','Chandelier','Pvalb','Sst','SstChodl','Astro','Endo',...
    'OPC','VLMC','Micro_PVM','Oligo'};
inpath='/data/users4/gfeng/projects/scfc/github/data';
for i=6:49
    load([inpath,'/f_ic_',num2str(i),'_celltype_t3.mat']);
    ic_r_real(i,:)=corr(ic,celltype,'type','spearman');
    ic_r_null=corr(ic_null,celltype,'type','spearman');
    ic_p=sum(abs(ic_r_real(i,:))<abs(ic_r_null),1)/1000;
    ic_p_fdr(i,:) = mafdr(ic_p, 'BHFDR', true);

    results{i,1}=celltype_name(ic_p_fdr(i,:)<0.05);
    results{i,2}=ic_r_real(i,ic_p_fdr(i,:)<0.05);
    results{i,3}=ic_p(ic_p_fdr(i,:)<0.05);
    results{i,4}=ic_p_fdr(i,ic_p_fdr(i,:)<0.05);
    results{i,5}=[ic,celltype(:,ic_p_fdr(i,:)<0.05)];
end





