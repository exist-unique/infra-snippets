#       _____                    _____                    _____                _____          
#      /\    \                  /\    \                  /\    \              /\    \         
#     /::\____\                /::\    \                /::\____\            /::\____\        
#    /:::/    /               /::::\    \              /::::|   |           /:::/    /        
#   /:::/    /               /::::::\    \            /:::::|   |          /:::/    /         
#  /:::/    /               /:::/\:::\    \          /::::::|   |         /:::/    /          
# /:::/____/               /:::/__\:::\    \        /:::/|::|   |        /:::/____/           
# |::|    |               /::::\   \:::\    \      /:::/ |::|   |        |::|    |            
# |::|    |     _____    /::::::\   \:::\    \    /:::/  |::|   | _____  |::|    |     _____  
# |::|    |    /\    \  /:::/\:::\   \:::\    \  /:::/   |::|   |/\    \ |::|    |    /\    \ 
# |::|    |   /::\____\/:::/__\:::\   \:::\____\/:: /    |::|   /::\____\|::|    |   /::\____\
# |::|    |  /:::/    /\:::\   \:::\   \::/    /\::/    /|::|  /:::/    /|::|    |  /:::/    /
# |::|    | /:::/    /  \:::\   \:::\   \/____/  \/____/ |::| /:::/    / |::|    | /:::/    / 
# |::|____|/:::/    /    \:::\   \:::\    \              |::|/:::/    /  |::|____|/:::/    /  
# |:::::::::::/    /      \:::\   \:::\____\             |::::::/    /   |:::::::::::/    /   
# \::::::::::/____/        \:::\   \::/    /             |:::::/    /    \::::::::::/____/    
#  ~~~~~~~~~~               \:::\   \/____/              |::::/    /      ~~~~~~~~~~          
#                            \:::\    \                  /:::/    /                           
#                             \:::\____\                /:::/    /                            
#                              \::/    /                \::/    /                             
#                               \/____/                  \/____/                              
                                                                                            
                       
# Check available software
module avail

# Check versions of a given software 
module avail python 

# Load specific version of python 
module load python/3.13.2

# Create virtual environment
virtualenv --no-download path_to_your_venv

# To download model weights from hugging face, install its CLI
pip install "huggingface_hub[cli]"

# Activate venv 
source path_to_your_venv/bin/activate

# Deactivate venv 
deactivate

# Create folder if not already exist 
mkdir -p path_to_your_local_dir

# Download model weights in the background + get process ID
nohup huggingface-cli download deepseek-ai/DeepSeek-R1 --local-dir path_to_your_local_dir & 
PID=$!
echo "Process started with PID: $PID"

# Check running processes with your HPC username 
ps -u your_user_name


#           _____                    _____            _____                    _____                    _____          
#          /\    \                  /\    \          /\    \                  /\    \                  /\    \         
#         /::\    \                /::\____\        /::\____\                /::\    \                /::\____\        
#        /::::\    \              /:::/    /       /:::/    /               /::::\    \              /::::|   |        
#       /::::::\    \            /:::/    /       /:::/    /               /::::::\    \            /:::::|   |        
#      /:::/\:::\    \          /:::/    /       /:::/    /               /:::/\:::\    \          /::::::|   |        
#     /:::/__\:::\    \        /:::/    /       /:::/    /               /:::/__\:::\    \        /:::/|::|   |        
#     \:::\   \:::\    \      /:::/    /       /:::/    /               /::::\   \:::\    \      /:::/ |::|   |        
#   ___\:::\   \:::\    \    /:::/    /       /:::/    /      _____    /::::::\   \:::\    \    /:::/  |::|___|______  
#  /\   \:::\   \:::\    \  /:::/    /       /:::/____/      /\    \  /:::/\:::\   \:::\____\  /:::/   |::::::::\    \ 
# /::\   \:::\   \:::\____\/:::/____/       |:::|    /      /::\____\/:::/  \:::\   \:::|    |/:::/    |:::::::::\____\
# \:::\   \:::\   \::/    /\:::\    \       |:::|____\     /:::/    /\::/   |::::\  /:::|____|\::/    / ~~~~~/:::/    /
#  \:::\   \:::\   \/____/  \:::\    \       \:::\    \   /:::/    /  \/____|:::::\/:::/    /  \/____/      /:::/    / 
#   \:::\   \:::\    \       \:::\    \       \:::\    \ /:::/    /         |:::::::::/    /               /:::/    /  
#    \:::\   \:::\____\       \:::\    \       \:::\    /:::/    /          |::|\::::/    /               /:::/    /   
#     \:::\  /:::/    /        \:::\    \       \:::\__/:::/    /           |::| \::/____/               /:::/    /    
#      \:::\/:::/    /          \:::\    \       \::::::::/    /            |::|  ~|                    /:::/    /     
#       \::::::/    /            \:::\    \       \::::::/    /             |::|   |                   /:::/    /      
#        \::::/    /              \:::\____\       \::::/    /              \::|   |                  /:::/    /       
#         \::/    /                \::/    /        \::/____/                \:|   |                  \::/    /        
#          \/____/                  \/____/          ~~                       \|___|                   \/____/         
                                                                                                                     
                                                                                                                                                                                                                                   
# Check your compute jobs 
sq 

# Cancel job by ID
scancel your_job_id

# Cancel all jobs 
scancel --me

# Display all partitions on the cluster (the flag -o stands for output)
sinfo -o %P

# Display GPU partitions and their GRES
sinfo -o "%P %G" | grep -i gpu

# Display node state given a partition (for example the parititon "gpubase_bygpu_b1")
sinfo -p gpubase_bygpu_b1 -N -o "%N %t"

# Display job info given id
scontrol show job 12345

# Request interactive session with 3xA100 GPU + 80GB CPU memory + 2 CPU cores + 2 hours time cap + bash shell
srun --gres=gpu:a100:3 --mem=80G --cpus-per-task=2 --time=02:00:00 --pty bash 

# Request an `a100_3g.20gb virtual GPU' with less memory, but often faster to allocate during 'rush hours'.
srun --gres=gpu:a100_3g.20gb:1 --pty bash 

# If you accidently disconnect from interactive session, reconnect with 
sattach your_job_id.0

# TODO: explain "sbatch" for non-interactive jobs. In the meantime, read its Slurm doc, or consult chat gpt!