#!/usr/bin/env bash
TESTPATH=$1
TESTLIST="lists/dtu/test.txt"
CKPT_FILE=$2
OUTDIR=$3
#python test.py --dataset dtu --batch_size 1 --testpath $TESTPATH --testlist $TESTLIST --resume $CKPT_FILE --outdir $OUTDIR --interval_scale 1.06 --num_view 5 --numdepth 192 --max_h 1152 --max_w 1536 --filter_method gipuma --disp_threshold 0.1 --num_consistent 2
CUDA_VISIBLE_DEVICES=1 nohup python -u test.py --dataset dtu --batch_size 1 --resume "saved_UR/2/models/CDS-MVSNet/0524_093301/checkpoint-epoch27.pth" --outdir ./output/inter512/27 --interval_scale 1.06 --num_view 5 --numdepth 512 --max_h 1152 --max_w 1536 --filter_method gipuma --disp_threshold 0.1 --num_consistent 2 >testLog/inter51227.log 2>&1 &