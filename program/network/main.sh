#!/bin/bash

current_path=$(pwd)
echo ${current_path}
cd ..
cd ..
main_path=$(pwd)
cd ${current_path}
echo $(pwd)

train_path=${main_path}/data/dataset/cross_val
test_file=${main_path}/data/dataset/independent_test/independent_test.csv
result_path=${main_path}/data/result
w2v_path=${main_path}/data/w2v_model

kfold=5
seqwin=41
machine_method=LGBM # RF SVM XGB LGBM NB KN 

for machine_method in LGBM 
do
for encode_method in EIIP ENAC TNC CKSNAP ANF W2V # ENAC binary NCP EIIP RCKmer DNC TNC CKSNAP ANF PseEIIP W2V
do 
echo ${machine_method}
echo ${encode_method}

python ml_train_test_D.py  --intrain ${train_path} --intest ${test_file} --outpath ${result_path} --machine ${machine_method}  --encode ${encode_method} --w2vmodel ${w2v_path} --fold ${kfold} --seqwin ${seqwin} 

done
done

