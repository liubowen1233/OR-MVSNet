# OR-MVSNet

## Requirements
    conda create -n venv python=3.9
    conda activate venv
    conda install pytorch==1.10.0 torchvision cudatoolkit=11.3 -c pytorch
    pip install -r requirements.txt

## Training
The training datasets including DTU and BlendedMVS are provided by [Yao Yao](https://github.com/YoYo000/MVSNet). 
 All training parameters are configured in a configuration file `*.json`. We provide two options for training

### Training on DTU
To train model on DTU dataset, change the directory of DTU dataset in the configuration file. Then, run this command:

    python train.py --config configs/config_dtu.json
    
After the training is finished, the train model will be saved in `saved/models/OR-MVSNet/<date_and_year>`. 

### Testing

**DTU**

First, download the DTU evaluation dataset from [Yao Yao](https://github.com/YoYo000/MVSNet).
To generate point clouds, users need to install [fusibile](https://github.com/kysucix/fusibile).
Run these commands to build fusibile:

    mkdir build && cd build
    cmake ..
    make
    cp fusibile ../

Then, change the parameters in file `dtu_eval.sh` if necessary and run it to generate reconstruction:

    bash scripts/dtu_eval.sh <path to DTU test set> <pretrained model> <output folder>

To evaluate these reconstructed point clouds, use the evaluation code from the [DTU benchmark website](https://roboimagedata.compute.dtu.dk/?page_id=36). 
We already provide the evaluation code in the evaluation folder. 
The results should be similar to this

|                       | Acc.   | Comp.  | Overall. |
|-----------------------|--------|--------|----------|
| OR-MVSNet(DTU, depths=48,32,8, intervals=4.0,2.0,1.0)  | 0.359  | 0.287  | 0.323    |

**Tanks & Temples**

Download the intermediate dataset preprocessed by [Yao Yao](https://github.com/YoYo000/MVSNet).
Note that users should use the short depth range of cameras
Run the evaluation script to produce the point clouds

    bash scripts/tt_eval.sh <path to intermediate set of Tanks&Temples> <pretrained model>

Submit the results to the [Tanks & Temples benchmark website](https://www.tanksandtemples.org/) to receive the F-score. 
Due to large point clouds generated, user may need a NVIDIA card with high memory.


<h3>Results on DTU dataset:</h3>
<table border="1">
    <tr>
        <td>acc.</td>
        <td>comp.</td>
        <td>overall</td>
    </tr>
    <tr>
        <td>0.359</td>
        <td>0.287</td>
        <td>0.323</td>
    </tr>
</table>

<img src="DTUCompare.png" alt="Big Boat">
